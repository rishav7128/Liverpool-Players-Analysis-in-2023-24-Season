
#UPDATING INFORMATION
ALTER TABLE liverpool_team
CHANGE mp match_played INT,
CHANGE starts starting_lineup INT,
CHANGE mt match_time INT,
CHANGE pos position TEXT;

#COMMIT    
    
SELECT nation,
COUNT(player_id) AS number_of_players
FROM liverpool_team
GROUP BY nation
ORDER BY nation ASC;

ALTER TABLE liverpool_team
ADD COLUMN full_name TEXT;

UPDATE liverpool_team
SET full_name = CONCAT(first_name, ' ', last_name);

#Performance Analysis of Liverpool Defenders: A Study of Goals and Assists Contributions on the basis of Match Played and Starting lineup
SELECT full_name, assist, goals, match_played, starting_lineup
FROM liverpool_team 
WHERE position LIKE '%DF%' AND (goals > 0 OR assist > 0)
GROUP BY full_name, assist, goals, match_played, starting_lineup
ORDER BY assist DESC;

#Performance Analysis of Liverpool Midfielders: A Study of Goals and Assists Contributions on the basis of Match Played and Starting lineup
SELECT full_name, assist, goals, match_played, starting_lineup
FROM liverpool_team 
WHERE position LIKE '%MF%' AND (goals > 0 OR assist > 0)
GROUP BY full_name, assist, goals, match_played, starting_lineup
ORDER BY assist DESC;

#Performance Analysis of Liverpool Forwards: A Study of Goals and Assists Contributions on the basis of Match Played and Starting lineup
SELECT full_name, assist, goals, match_played, starting_lineup
FROM liverpool_team 
WHERE position LIKE '%FW%' AND (goals > 0 OR assist > 0)
GROUP BY full_name, assist, goals, match_played, starting_lineup
ORDER BY assist DESC;

#Identifying Goal-Less and Assist-Less Forwards in Liverpool on the basis of Match Played and Starting lineup
SELECT full_name, assist, goals, match_played, starting_lineup
FROM liverpool_team 
WHERE (position LIKE '%FW%') AND (goals = 0 AND assist = 0)
GROUP BY full_name, assist, goals, match_played, starting_lineup
ORDER BY assist DESC;

#Identifying Goal-Less and Assist-Less Midfielders in Liverpool on the basis of Match Played and Starting lineup
SELECT full_name, assist, goals, match_played, starting_lineup
FROM liverpool_team 
WHERE (position LIKE '%MF%') AND (goals = 0 AND assist = 0)
GROUP BY full_name, assist, goals, match_played, starting_lineup
ORDER BY assist DESC;
