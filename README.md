# 🏆 2026 FIFA World Cup Group Standings & Analytics Pipeline

A production-grade data engineering pipeline that dynamically ingests live tournament match results and timeline events from public sports feeds, normalizes the relational data stream, and computes complex international tournament standings completely inside an optimized SQLite database layer.

---

## 🚀 Architecture & Pipeline Overview

This repository demonstrates advanced SQL data modeling, transaction handling, and idempotent ETL (Extract, Transform, Load) pipeline orchestration using Python and SQLite.

Rather than relying on resource-intensive backend application loops to calculate tournament metrics, this architecture offloads all data aggregation, tie-breaking math, and analytics down to high-performance database **Views** and **Window Functions**.

### 📁 Repository Structure

* `schema.sql` — The core relational blueprint defining production tables, multi-column foreign key rules, and automated analytical views.
* `db_initializer.py` — A transaction-safe database builder script that initializes tables and mounts structural views.
* `standing_manager.py` — The core single-match processing engine that handles payloads, normalizes raw event types, and cleanly executes database mutations.
* `batch_orchestrator.py` — The master loop pipeline that queries tournament endpoints, screens match completion status, and sequentially processes data with rate-limiting controls.

---

## 📊 Database Engine & View Analytics

The relational schema is built on a 1:Many architecture connecting tournament groups, match boxes, and live disciplinary timelines. The true power of the project lies in its three core automated views:

### 1. Group Standings (`v_worldcup_group_standings`)

Computes official FIFA tournament standings dynamically. It uses a **Common Table Expression (CTE)** to normalize separate Home and Away match records into a single team perspective, aggregates points ($Win = 3$, $Draw = 1$, $Loss = 0$), and applies a window function (`ROW_NUMBER() OVER (...)`) to automatically rank groups by:

1. Total Points
2. Goal Difference (`GD`)
3. Goals For (`GF`)
4. Fair Play Disciplinary Points

It also features advanced conditional tracking (`third_place_global_rank`) to evaluate global wildcard qualification across the entire tournament structure.

### 2. Fair Play Governance (`v_fair_play_points_standings`)

Tracks official tournament disciplinary points natively by evaluating timeline event logs:

* Yellow Card: `-1 Point`
* Second Yellow Card: `-3 Points`
* Direct Red Card: `-4 Points`

### 3. Golden Boot Tracker (`v_player_cards`)

Aggregates and metrics every tracked card type alongside a conditional count of **Goals Scored** per player, automatically ranking individual athlete performances in a centralized scoreboard view.

---

## 🛠️ Tech Stack & Implementation Details

* **Language:** Python 3.10+
* **Database Engine:** SQLite 3
* **Libraries Used:** `sqlite3` (Standard Library), `requests` (API Fetching), `time` (Rate Limiting)
* **Design Patterns:** Idempotent Ingestion, Separation of Concerns, Transaction Safety via Context Managers

---

## ⚙️ Quick Start & Execution

1. **Initialize the Database Sandbox:**

   ```bash
   python db_initializer.py
