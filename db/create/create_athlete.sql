-- Dennis Nwanevu Chong Ochulor - 22472393
-- Creates the Athlete table

DROP TABLE IF EXISTS Athlete; -- ensure no duplicates

-- create the table
CREATE TABLE Athlete(
	participant_id VARCHAR(17) PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	gender CHAR(1) NOT NULL,
	height INT,
	weight INT,
	birthdate DATE,
	FOREIGN KEY (participant_id) REFERENCES Participant(participant_id) ON DELETE CASCADE,
	CHECK (gender IN ('M','F'))
);

