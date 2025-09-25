-- Dennis Nwanevu Chong Ochulor - 22472393
-- Stored procedure to streamline the process of inserting new Athletes

DROP PROCEDURE IF EXISTS insertAthlete; -- ensure no duplicates
DELIMITER $$
CREATE PROCEDURE insertAthlete(
	IN name VARCHAR(100),
	IN gender CHAR(1),
	IN country CHAR(3),
	IN height INT,
	IN weight INT,
	IN birthdate DATE,
	OUT new_athlete_id VARCHAR(17)
)
COMMENT 'Insert new athlete into Athlete/Participant tables'
BEGIN
	DECLARE nextid VARCHAR(17);
	SELECT MAX(participant_id)+1 FROM Athlete INTO nextid;
	SET new_athlete_id = nextid;
	INSERT INTO Participant VALUES(nextid, 'A', country);
	INSERT INTO Athlete VALUES(nextid, name, gender, height, weight, birthdate); 
END$$
DELIMITER ;
