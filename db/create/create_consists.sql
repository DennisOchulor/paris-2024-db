-- Dennis Nwanevu Chong Ochulor - 22472393
-- Creates the Consists table

DROP TABLE IF EXISTS Consists; -- ensure no duplicates

-- create the table
CREATE TABLE Consists(
	athlete_id VARCHAR(17),
	team_id VARCHAR(17),
	PRIMARY KEY(athlete_id, team_id),
	FOREIGN KEY(athlete_id) REFERENCES Athlete(participant_id),
	FOREIGN KEY(team_id) REFERENCES Team(participant_id)
);

