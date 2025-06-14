CREATE OR REPLACE TABLE `gen-lang-client-0923042489.nba_project.team_game_logs_b2b` AS
SELECT 
  TEAM_NAME,
  TEAM_ID,
  GAME_ID,
  GAME_DATE,
  MATCHUP,
  WL,
  PTS,
  FG_PCT,
  AST,
  TOV,
  LAG(GAME_DATE) OVER (PARTITION BY TEAM_ID ORDER BY GAME_DATE) AS PREV_GAME_DATE,
  DATE_DIFF(GAME_DATE, LAG(GAME_DATE) OVER (PARTITION BY TEAM_ID ORDER BY GAME_DATE), DAY) AS DAYS_SINCE_LAST,
  CASE 
    WHEN DATE_DIFF(GAME_DATE, LAG(GAME_DATE) OVER (PARTITION BY TEAM_ID ORDER BY GAME_DATE), DAY) = 1 THEN TRUE
    ELSE FALSE
  END AS IS_BACK_TO_BACK
FROM `gen-lang-client-0923042489.nba_project.team_game_logs`;
