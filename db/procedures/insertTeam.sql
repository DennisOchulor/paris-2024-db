-- Dennis Nwanevu Chong Ochulor - 22472393
-- Stored procedure to streamline the process of inserting new Teams

DROP PROCEDURE IF EXISTS insertTeam; -- ensure no duplicates
DELIMITER $$
CREATE PROCEDURE insertTeam(
	IN team_id VARCHAR(17),
	IN country CHAR(3)
)
COMMENT 'Insert new Team into Team/Participant tables'
BEGIN
	INSERT INTO Participant VALUES(team_id, 'T', country);
	INSERT INTO Team VALUES(team_id, 0); -- num_athletes will be updated by trigger on Consists table 
END$$
DELIMITER ;
