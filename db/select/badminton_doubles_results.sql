-- Dennis Nwanevu Chong Ochulor - 22472393
-- Q7: What are the results of all the Badminton doubles medal events?

SELECT a.sport_id AS Sport, a.category AS Category, a.stage AS Stage,
SUBSTRING(a.participant_id,13) AS Team1, CONCAT(a.result,' - ',b.result) AS Results, SUBSTRING(b.participant_id,13) AS Team2 -- cut off the redundant part of the team's id
FROM Participate a INNER JOIN Participate b
ON a.sport_id = b.sport_id AND a.category = b.category AND a.stage = b.stage AND a.participant_id != b.participant_id -- don't join the exact same row with itself
WHERE a.sport_id = 'BDM' AND a.category LIKE '%Doubles%' AND (a.medal = 'G' OR a.medal = 'B')
ORDER BY a.category, a.stage;
