import sqlite3
import os

# Prompt user for input in the terminal window
file_path = input("Enter the path or name of your text file to import: ").strip()
file_path = file_path.strip("'\"")

if not os.path.exists(file_path):
    print(f"❌ Error: The file '{file_path}' could not be found.")
    exit(1)

# Connect to your existing database file
conn = sqlite3.connect("2026WorldCup.db")
cursor = conn.cursor()

# Read, clean, and insert data from the text file
with open(file_path, "r", encoding="utf-8") as f:
    for line in f:
        if line.strip():  # Skip any empty lines
            # Split by comma and strip extra spaces around strings
            row = [item.strip() for item in line.split(",")]

            if len(row) == 3:
                # Using INSERT OR IGNORE to safely skip duplicates due to UNIQUE constraints
                cursor.execute(
                    """
                    INSERT OR IGNORE INTO groups (TeamName, TeamCode, GroupLetter) 
                    VALUES (?, ?, ?)
                """,
                    row,
                )

# Save changes and disconnect
conn.commit()
conn.close()
print("Data successfully loaded into the 'groups' table!")