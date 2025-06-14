# NBA Back-to-Back Game Analysis with SQL

This project analyzes NBA team performance on the second night of back-to-back games using SQL and real NBA data.

## 🔍 Objective

To determine **which NBA teams overperform or underperform** when playing on the second night of a back-to-back — and identify patterns in performance under fatigue.

## 💾 Tools Used

- `nba_api` (Python) for real-time data scraping
- Google BigQuery for SQL querying
- Python + Pandas for data export
- CSV files for import/export
- GitHub for version control

## 📊 Key Datasets

- `nba_team_game_logs.csv`: Team-level game logs from the 2023–24 season
- `nba_team_standings.csv`: Team win/loss records from 2023–24 standings

## 📈 What I Did

- Pulled  NBA data using Python and `nba_api`
- Loaded cleaned data into BigQuery
- Flagged back-to-back games using SQL `LAG()` and `DATE_DIFF()`
- Joined back-to-back performance with full-season standings
- Calculated which teams **overperform** or **underperform** on B2Bs

## Insights

- 📈 **Portland Trail Blazers** won 57% of their back-to-backs despite a 25% season win rate (overperforming by +31%).
- 📉 **Indiana Pacers** had the worst drop-off, winning only 23% of B2Bs despite a 57% season win rate.
- Some contenders like the Celtics and Suns **thrived** on B2Bs, while others (like the Cavs and Thunder) regressed.

## 📁 File Structure

- `/get_team_data.py`: script to pull game logs
- `/get_standings.py`: script to pull standings
- `/queries`: reusable SQL scripts (table creation, analysis)
- `README.md`: this file


## 📬 Contact

Built by Zachary Ross
