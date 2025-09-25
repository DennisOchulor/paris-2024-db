-- Dennis Nwanevu Chong Ochulor - 22472393
-- Trigger to decrement the num_athletes of Team table

DROP TRIGGER IF EXISTS afterDeleteConsists; -- ensure no duplicates
CREATE TRIGGER afterDeleteConsists
AFTER DELETE ON Consists
FOR EACH ROW
	UPDATE Team
	SET num_athletes = num_athletes - 1
	WHERE participant_id = OLD.team_id;
