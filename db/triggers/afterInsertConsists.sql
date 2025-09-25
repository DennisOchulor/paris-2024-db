-- Dennis Nwanevu Chong Ochulor - 22472393
-- Trigger to increment the num_athletes of Team table

DROP TRIGGER IF EXISTS afterInsertConsists; -- ensure no duplicates
CREATE TRIGGER afterInsertConsists
AFTER INSERT ON Consists
FOR EACH ROW
	UPDATE Team
	SET num_athletes = num_athletes + 1
	WHERE participant_id = NEW.team_id;
