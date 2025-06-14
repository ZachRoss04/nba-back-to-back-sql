WITH name_map AS (
  SELECT 'Atlanta Hawks' AS logs_team, 'Hawks' AS standings_team UNION ALL
  SELECT 'Boston Celtics', 'Celtics' UNION ALL
  SELECT 'Brooklyn Nets', 'Nets' UNION ALL
  SELECT 'Charlotte Hornets', 'Hornets' UNION ALL
  SELECT 'Chicago Bulls', 'Bulls' UNION ALL
  SELECT 'Cleveland Cavaliers', 'Cavaliers' UNION ALL
  SELECT 'Dallas Mavericks', 'Mavericks' UNION ALL
  SELECT 'Denver Nuggets', 'Nuggets' UNION ALL
  SELECT 'Detroit Pistons', 'Pistons' UNION ALL
  SELECT 'Golden State Warriors', 'Warriors' UNION ALL
  SELECT 'Houston Rockets', 'Rockets' UNION ALL
  SELECT 'Indiana Pacers', 'Pacers' UNION ALL
  SELECT 'LA Clippers', 'Clippers' UNION ALL
  SELECT 'Los Angeles Lakers', 'Lakers' UNION ALL
  SELECT 'Memphis Grizzlies', 'Grizzlies' UNION ALL
  SELECT 'Miami Heat', 'Heat' UNION ALL
  SELECT 'Milwaukee Bucks', 'Bucks' UNION ALL
  SELECT 'Minnesota Timberwolves', 'Timberwolves' UNION ALL
  SELECT 'New Orleans Pelicans', 'Pelicans' UNION ALL
  SELECT 'New York Knicks', 'Knicks' UNION ALL
  SELECT 'Oklahoma City Thunder', 'Thunder' UNION ALL
  SELECT 'Orlando Magic', 'Magic' UNION ALL
  SELECT 'Philadelphia 76ers', '76ers' UNION ALL
  SELECT 'Phoenix Suns', 'Suns' UNION ALL
  SELECT 'Portland Trail Blazers', 'Trail Blazers' UNION ALL
  SELECT 'Sacramento Kings', 'Kings' UNION ALL
  SELECT 'San Antonio Spurs', 'Spurs' UNION ALL
  SELECT 'Toronto Raptors', 'Raptors' UNION ALL
  SELECT 'Utah Jazz', 'Jazz' UNION ALL
  SELECT 'Washington Wizards', 'Wizards'
),
b2b AS (
  SELECT 
    TEAM_NAME,
    COUNT(*) AS b2b_games,
    SUM(CASE WHEN WL = 'W' THEN 1 ELSE 0 END) AS b2b_wins,
    ROUND(SUM(CASE WHEN WL = 'W' THEN 1 ELSE 0 END) / COUNT(*), 3) AS b2b_win_pct
  FROM `gen-lang-client-0923042489.nba_project.team_game_logs_b2b`
  WHERE IS_BACK_TO_BACK = TRUE
  GROUP BY TEAM_NAME
),
season AS (
  SELECT 
    TeamName,
    WINS AS season_wins,
    LOSSES AS season_losses,
    ROUND(WINS / (WINS + LOSSES), 3) AS season_win_pct
  FROM `gen-lang-client-0923042489.nba_project.team_standings`
)
SELECT 
  b2b.TEAM_NAME,
  b2b.b2b_games,
  b2b.b2b_win_pct,
  season.season_win_pct,
  ROUND(b2b.b2b_win_pct - season.season_win_pct, 3) AS overperformance
FROM b2b
JOIN name_map ON b2b.TEAM_NAME = name_map.logs_team
JOIN season ON name_map.standings_team = season.TeamName
ORDER BY overperformance DESC;
