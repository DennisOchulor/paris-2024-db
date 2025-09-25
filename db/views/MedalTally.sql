-- Dennis Nwanevu Chong Ochulor - 22472393
-- A view that shows the medal tally for each country

DROP VIEW IF EXISTS MedalTally; -- ensure no duplicates
CREATE VIEW MedalTally AS
	SELECT a.country_id, a.name,
	(SELECT COUNT(*) FROM Participate NATURAL JOIN Participant p WHERE a.country_id = p.country_id AND medal = 'G') AS Gold,
	(SELECT COUNT(*) FROM Participate NATURAL JOIN Participant p WHERE a.country_id = p.country_id AND medal = 'S') AS Silver,
	(SELECT COUNT(*) FROM Participate NATURAL JOIN Participant p WHERE a.country_id = p.country_id AND medal = 'B') AS Bronze,
	(SELECT COUNT(*) FROM Participate NATURAL JOIN Participant p WHERE a.country_id = p.country_id AND medal IS NOT NULL) AS Total
	FROM Country a
	HAVING Total > 0
	ORDER BY Gold DESC, Silver DESC, Bronze DESC;

