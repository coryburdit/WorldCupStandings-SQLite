import sqlite3
import requests
import warnings
import time

# Suppress connection warnings across environments
warnings.filterwarnings("ignore", message=".*OpenSSL.*")
warnings.filterwarnings("ignore", message=".*urllib3.*")

def test_ingest_dry_run_batch(game_ids, db_name="2026WorldCup.db"):
    """
    Loops through an iterable list of ESPN game IDs to perform a simulated, 
    read-only data ingestion sequence across multiple matches.
    """
    url_template = "https://site.api.espn.com/apis/site/v2/sports/soccer/fifa.world/summary?event={}"
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"
    }

    print(f"=== BATCH DRY RUN START ({len(game_ids)} Matches Target) ===")
    print(f"Connecting to database: {db_name} (Read-Only Mode for Testing)")
    print("-" * 75)

    try:
        conn = sqlite3.connect(db_name)
        cursor = conn.cursor()

        for idx, game_id in enumerate(game_ids, start=1):
            print(f"\n🔄 [{idx}/{len(game_ids)}] Processing Game ID: {game_id}...")
            url = url_template.format(game_id)

            try:
                response = requests.get(url, headers=headers, timeout=10)
                response.raise_for_status()
                data = response.json()

                # --- 1. Parse ESPN Match Basics & Capture IDs ---
                competition = data.get("header", {}).get("competitions", [{}])[0]
                status = competition.get("status", {}).get("type", {}).get("detail", "Unknown")

                raw_home = {}
                raw_away = {}

                for competitor in competition.get("competitors", []):
                    team_info = {
                        "id": str(competitor["team"]["id"]),          
                        "code": competitor["team"]["abbreviation"],  
                        "score": int(competitor.get("score", 0)),
                    }
                    if competitor["homeAway"] == "home":
                        raw_home = team_info
                    else:
                        raw_away = team_info

                # --- 2. Run Database Lookups using TeamCodes ---
                cursor.execute("SELECT TeamName FROM groups WHERE TeamCode = ?", (raw_home["code"],))
                home_row = cursor.fetchone()
                home_name = home_row[0] if home_row else None

                cursor.execute("SELECT TeamName FROM groups WHERE TeamCode = ?", (raw_away["code"],))
                away_row = cursor.fetchone()
                away_name = away_row[0] if away_row else None

                if not home_name or not away_name:
                    print(f"  ⚠️  Skipping Game {game_id}: Codes '{raw_home.get('code')}' or '{raw_away.get('code')}' not found in 'groups' table.")
                    continue

                # --- 3. Formulate Match Results Insert ---
                match_id_int = int(game_id)
                match_params = (
                    match_id_int, home_name, raw_home["code"], status,
                    raw_home["score"], away_name, raw_away["code"], raw_away["score"],
                )
                print(f"  [PROPOSED] Match Results: {home_name} ({raw_home['code']}) {raw_home['score']} - {raw_away['score']} {away_name} ({raw_away['code']}) [{status}]")

                # --- 4. Parse Soccer Timeline Stream ('keyEvents') ---
                timeline = data.get("keyEvents", [])
                events_found = 0

                for item in timeline:
                    raw_type = item.get("type", {}).get("text", "")
                    team_obj = item.get("team")

                    if not team_obj:
                        continue

                    event_team_id = str(team_obj.get("id"))
                    
                    if event_team_id == raw_home["id"]:
                        event_team_name = home_name
                        event_team_code = raw_home["code"]
                    elif event_team_id == raw_away["id"]:
                        event_team_name = away_name
                        event_team_code = raw_away["code"]
                    else:
                        continue

                    event_time = item.get("clock", {}).get("displayValue", "0'")
                    player_obj = item.get("athlete") or item.get("player") or {}
                    player_name = player_obj.get("displayName", "Unknown Player")

                    raw_type_lower = raw_type.lower()
                    event_type = None

                    if "yellow card" in raw_type_lower and "second" not in raw_type_lower:
                        event_type = "Yellow Card"
                    elif "second yellow card" in raw_type_lower:
                        event_type = "Second Yellow Card"
                    elif "red card" in raw_type_lower:
                        event_type = "Red Card"

                    if event_type:
                        events_found += 1
                        print(f"    ↳ Event #{events_found}: {event_team_code} | {event_type} | {player_name} ({event_time})")

                print(f"  ✔️ Successfully verified {events_found} total event log entries for this match.")
                
                # 🛑 Defensive Coding: Respect the API endpoint limits
                time.sleep(1)

            except requests.exceptions.RequestException as req_err:
                print(f"  ❌ Network/API Error processing game {game_id}: {req_err}")
                continue
            except Exception as inner_err:
                print(f"  ❌ Error parsing payload data structures for game {game_id}: {inner_err}")
                continue

        conn.close()
        print(f"\n=== BATCH DRY RUN COMPLETE (No mutations were executed on the database) ===")

    except Exception as e:
        print(f"\n[BATCH CRITICAL FAILURE]: {e}")


if __name__ == "__main__":
    # Supply an explicit collection array of valid target tournament match IDs
    target_game_ids = ["621849", "621850", "621851"] 
    test_ingest_dry_run_batch(target_game_ids)