-- Dennis Nwanevu Chong Ochulor - 22472393
-- Creates the Team table

DROP TABLE IF EXISTS Team; -- ensure no duplicates

-- create the table
CREATE TABLE Team(
	participant_id VARCHAR(17) PRIMARY KEY,
	num_athletes INT NOT NULL DEFAULT 0,
	FOREIGN KEY (participant_id) REFERENCES Participant(participant_id) ON DELETE CASCADE
);

