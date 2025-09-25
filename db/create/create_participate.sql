-- Dennis Nwanevu Chong Ochulor - 22472393
-- Creates the Participate table

DROP TABLE IF EXISTS Participate; -- ensure no duplicates

-- create the table
CREATE TABLE Participate(
	participant_id VARCHAR(17),
	sport_id CHAR(3),
	category VARCHAR(40),
	stage VARCHAR(40),
	result VARCHAR(15),
	result_type VARCHAR(15),
	outcome CHAR(1),
	ranking INT,
	medal CHAR(1),
	PRIMARY KEY(participant_id,sport_id,category,stage),
	FOREIGN KEY (participant_id) REFERENCES Participant(participant_id),
	FOREIGN KEY (sport_id,category,stage) REFERENCES Event(sport_id,category,stage),
	CHECK (outcome IN ('W','L','T')),
	CHECK (medal IN ('G','S','B') OR medal IS NULL)
);

