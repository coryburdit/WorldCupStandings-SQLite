-- ====================================================================
-- 1. BASE TABLES (Optimized Foreign Keys)
-- ====================================================================

CREATE TABLE IF NOT EXISTS groups(
    id INTEGER PRIMARY KEY,
    TeamName TEXT NOT NULL,
    TeamCode TEXT NOT NULL UNIQUE, -- Added UNIQUE constraint here
    GroupLetter TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS matchresults(
    match_id INTEGER PRIMARY KEY,
    HomeTeamName TEXT NOT NULL,
    HomeTeamCode TEXT NOT NULL,
    status TEXT NOT NULL,
    Home_goals_scored INTEGER NOT NULL DEFAULT 0,
    AwayTeamName TEXT NOT NULL,
    AwayTeamCode TEXT NOT NULL,
    Away_goals_scored INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY (HomeTeamCode) REFERENCES groups(TeamCode), -- Simplified
    FOREIGN KEY (AwayTeamCode) REFERENCES groups(TeamCode)  -- Simplified
);

CREATE TABLE IF NOT EXISTS matcheventlogs (
    event_id INTEGER PRIMARY KEY AUTOINCREMENT,
    match_id INTEGER NOT NULL,
    TeamName TEXT NOT NULL,
    TeamCode TEXT NOT NULL,
    event_type TEXT NOT NULL,
    event_time TEXT NOT NULL,
    player_name TEXT NOT NULL, 
    GroupLetter TEXT,
    FOREIGN KEY (match_id) REFERENCES matchresults(match_id),
    FOREIGN KEY (TeamCode) REFERENCES groups(TeamCode)       -- Simplified
);