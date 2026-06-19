import os
import requests
import warnings

# Import the core execution pipeline from your companion file
from ingest_espn import ingest_espn_match

warnings.filterwarnings("ignore", message=".*OpenSSL.*")
warnings.filterwarnings("ignore", message=".*urllib3.*")


def fetch_and_ingest_all_played():
    # ESPN Scoreboard endpoint scoped to the full tournament calendar window
    url = "https://site.api.espn.com/apis/site/v2/sports/soccer/fifa.world/scoreboard?limit=100&dates=20260611-20260719"
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"
    }

    print("🛰️  Connecting to ESPN Master Scoreboard...")

    try:
        response = requests.get(url, headers=headers)
        response.raise_for_status()
        data = response.json()

        events = data.get("events", [])
        played_game_ids = []

        # Loop through all scheduled tournament events
        for event in events:
            game_id = str(event.get("id"))
            status_obj = event.get("status", {}).get("type", {})
            status_detail = status_obj.get("detail", "")
            is_completed = status_obj.get("completed", False)

            # Capture games that are either finalized (FT) or actively in progress
            if status_detail == "FT" or is_completed or "In Progress" in status_detail or ":" in status_detail:
                played_game_ids.append(game_id)

        total_games = len(played_game_ids)
        print(f"📊 Found {total_games} matches active or completed to process in this window.\n")

        if total_games == 0:
            print("No active or completed matches found in the current timeline yet.")
            return

        # Sequentially feed IDs into your data processing pipeline
        for index, game_id in enumerate(played_game_ids, 1):
            print(f"🔄 Processing [{index}/{total_games}] | Game ID: {game_id}")
            ingest_espn_match(game_id)
            print("-" * 50)

        print("\n🏆 Master batch ingestion successfully completed!")

    except Exception as e:
        print(f"❌ Failed to parse master scoreboard list: {e}")


if __name__ == "__main__":
    fetch_and_ingest_all_played()