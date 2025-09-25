-- Dennis Nwanevu Chong Ochulor - 22472393
-- A view that shows every single athlete that obtained a medal

DROP VIEW IF EXISTS Medallists; -- ensure no duplicates
CREATE VIEW Medallists AS
	-- First part is for individual events
	SELECT medal, name, country_id, sport_id, category
	FROM Participate NATURAL JOIN Participant NATURAL JOIN Athlete
	WHERE medal IS NOT NULL
	UNION
	-- Second part is for Team events, to get each athlete in the team
	SELECT medal, name, country_id, sport_id, category
	FROM Participate NATURAL JOIN Participant NATURAL JOIN Team
	INNER JOIN Consists ON Team.participant_id = Consists.team_id
	INNER JOIN Athlete ON Consists.athlete_id = Athlete.participant_id
	WHERE medal IS NOT NULL
	ORDER BY sport_id, category;

