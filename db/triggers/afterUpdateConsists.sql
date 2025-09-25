-- Dennis Nwanevu Chong Ochulor - 22472393
-- Trigger to update the num_athletes of Team table

-- team_id changes, athlete_id same ~ OLD -1, NEW +1
-- team_id same, athlete_id changes ~ OLD -1, NEW +1 OR no changes to num_athletes
-- both change ~ OLD -1, NEW +1

DROP TRIGGER IF EXISTS afterUpdateConsists; -- ensure no duplicates
DELIMITER $$
CREATE TRIGGER afterUpdateConsists
AFTER UPDATE ON Consists
FOR EACH ROW
BEGIN
	UPDATE Team
	SET num_athletes = num_athletes - 1
	WHERE participant_id = OLD.team_id;

	UPDATE Team
	SET num_athletes = num_athletes + 1
	WHERE participant_id = NEW.team_id;
END$$
DELIMITER ;

