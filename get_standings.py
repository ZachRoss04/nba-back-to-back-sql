from nba_api.stats.endpoints import leaguestandings
import pandas as pd
import time

print("Requesting standings from NBA API...")
time.sleep(1)

standings = leaguestandings.LeagueStandings(season='2023-24')
print("Data received!")

df = standings.get_data_frames()[0]
print("DataFrame created with shape:", df.shape)

df.to_csv('nba_team_standings.csv', index=False)
print("✅ Saved standings to nba_team_standings.csv")
