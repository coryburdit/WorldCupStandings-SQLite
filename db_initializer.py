import os
import sqlite3

def initialize_database(db_path="2026WorldCup.db", schema_path="schema.sql"):
    """
    Safely reads a standalone schema.sql file and executes it sequentially 
    to build base tables, apply foreign key constraints, and establish views.
    """
    print("🔄 Initializing database buildup protocol...")
    
    # Verify the schema file exists before touching the database
    if not os.path.exists(schema_path):
        raise FileNotFoundError(f"❌ Error: Could not locate schema file at '{schema_path}'")

    try:
        # Context manager handles connection, automatic commit on success, and rollback on error
        with sqlite3.connect(db_path) as conn:
            # Ensure foreign keys are explicitly supported by the runtime connection
            conn.execute("PRAGMA foreign_keys = ON;")
            
            with open(schema_path, "r", encoding="utf-8") as schema_file:
                schema_sql = schema_file.read()
            
            # executescript splits on semicolons and runs the entire transaction block sequentially
            conn.executescript(schema_sql)
            
        print(f"🚀 Success: Database created and schema views mounted at '{db_path}'.")
        
    except sqlite3.Error as e:
        print(f"❌ Database Initialization Failed: {e}")

if __name__ == "__main__":
    initialize_database()