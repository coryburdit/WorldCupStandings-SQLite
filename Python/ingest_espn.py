import os
import sqlite3
import requests
import warnings

# Clear out environment setup warnings cleanly
warnings.filterwarnings("ignore", message=".*OpenSSL.*")
warnings.filterwarnings("ignore", message=".*urllib3.*")


def init_user_db():
    conn = sqlite3.connect("2026WorldCup.db")
    # Foreign key enforcement must be turned on for EVERY connection instance
    conn.execute("PRAGMA foreign_keys = ON;")
    return conn


def ingest_espn_match(game_id):
    url = f"https://site.api.espn.com/apis/site/v2/sports/soccer/fifa.world/summary?event={game_id}"
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"
    }

    try:
        conn = init_user_db()
        cursor = conn.cursor()

        response = requests.get(url, headers=headers)
        response.raise_for_status()
        data = response.json()

        # --- 1. Parse Match Basics & Fetch IDs ---
        competition = data.get("header", {}).get("competitions", [{}])[0]
        status = competition["status"]["type"]["detail"]

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

        # --- 2. Resolve Names & Group Letters Against Your 'groups' Table ---
        cursor.execute(
            "SELECT TeamName, GroupLetter FROM groups WHERE TeamCode = ?", (raw_home["code"],)
        )
        home_row = cursor.fetchone()
        home_name = home_row[0] if home_row else None
        home_group = home_row[1] if home_row else None

        cursor.execute(
            "SELECT TeamName, GroupLetter FROM groups WHERE TeamCode = ?", (raw_away["code"],)
        )
        away_row = cursor.fetchone()
        away_name = away_row[0] if away_row else None
        away_group = away_row[1] if away_row else None

        if not home_name or not away_name:
            print(f"❌ Ingestion stopped: Missing team mappings in 'groups' table for {raw_home.get('code')} or {raw_away.get('code')}.")
            conn.close()
            return

        # --- 3. BEGIN TRANSACTION BLOCK ---
        # Wrapping operations in a context manager automatically commits on success or rolls back on error
        with conn:
            conn.execute("BEGIN TRANSACTION;")

            # Clear out existing match event rows first to avoid cascading key blocks
            cursor.execute("DELETE FROM matcheventlogs WHERE match_id = ?", (game_id,))
            cursor.execute("DELETE FROM matchresults WHERE match_id = ?", (game_id,))

            # --- 4. Commit Match Results ---
            cursor.execute(
                """
                INSERT INTO matchresults 
                (match_id, HomeTeamName, HomeTeamCode, status, Home_goals_scored, AwayTeamName, AwayTeamCode, Away_goals_scored)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                """,
                (
                    int(game_id), # Ensure integer casting matches schema primary key definition
                    home_name,
                    raw_home["code"],
                    status,
                    raw_home["score"],
                    away_name,
                    raw_away["code"],
                    raw_away["score"],
                ),
            )

            # --- 5. Stream Timeline Events ('keyEvents') ---
            timeline = data.get("keyEvents", [])
            events_inserted = 0

            for item in timeline:
                raw_type = item.get("type", {}).get("text", "")
                team_obj = item.get("team")

                if not team_obj:
                    continue

                event_team_id = str(team_obj.get("id"))

                if event_team_id == raw_home["id"]:
                    event_team_name = home_name
                    event_team_code = raw_home["code"]
                    event_group = home_group
                elif event_team_id == raw_away["id"]:
                    event_team_name = away_name
                    event_team_code = raw_away["code"]
                    event_group = away_group
                else:
                    continue

                event_time = item.get("clock", {}).get("displayValue", "0'")

                # Player Name Lookup
                player_obj = {}
                if item.get("participants"):
                    player_obj = item["participants"][0].get("athlete", {})
                else:
                    player_obj = item.get("player") or item.get("athlete") or {}

                player_name = player_obj.get("displayName", "Unknown Player")

                # Filter and normalize card variants
                raw_type_lower = raw_type.lower()
                event_type = None
                
                if "second yellow card" in raw_type_lower or "second yellow" in raw_type_lower:
                    event_type = "Second Yellow Card"
                elif "yellow card" in raw_type_lower:
                    event_type = "Yellow Card"
                elif "red card" in raw_type_lower:
                    event_type = "Red Card"
                elif "goal" in raw_type_lower:
                    event_type = "Goal"
                else:
                    event_type = "Unknown Event"

                if event_type == "Unknown Event":
                    continue

                cursor.execute(
                    """
                    INSERT INTO matcheventlogs (match_id, TeamName, TeamCode, event_type, event_time, player_name, GroupLetter)
                    VALUES (?, ?, ?, ?, ?, ?, ?)
                    """,
                    (
                        int(game_id),
                        event_team_name,
                        event_team_code,
                        event_type,
                        event_time,
                        player_name,
                        event_group,
                    ),
                )
                events_inserted += 1

        print(f"🚀 Success! Match {game_id} is live in 2026WorldCup.db.")
        print(f"   Saved box score details and {events_inserted} verified disciplinary rows.")
        conn.close()

    except Exception as e:
        print(f"❌ Database write execution failed for Game ID {game_id}: {e}")


if __name__ == "__main__":
    # Test execution block requiring a target tournament game id argument
    sample_id = "760415"
    ingest_espn_match(sample_id)