from nba_api.stats.endpoints import teamgamelogs
import pandas as pd

# Get team game logs for 2023-24 season
logs = teamgamelogs.TeamGameLogs(season_nullable='2023-24')

# Convert to dataframe
df = logs.get_data_frames()[0]

# Save to CSV
df.to_csv("nba_team_game_logs.csv", index=False)

print("Saved team game logs to nba_team_game_logs.csv")
