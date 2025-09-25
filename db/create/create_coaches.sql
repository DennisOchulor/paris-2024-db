-- Dennis Nwanevu Chong Ochulor - 22472393
-- Creates the Coaches table

DROP TABLE IF EXISTS Coaches; -- ensure no duplicates

-- create the table
CREATE TABLE Coaches(
	participant_id VARCHAR(17),
	coach_id VARCHAR(7),
	PRIMARY KEY(participant_id,coach_id),
	FOREIGN KEY(participant_id) REFERENCES Participant(participant_id),
	FOREIGN KEY(coach_id) REFERENCES Coach(coach_id)
);

