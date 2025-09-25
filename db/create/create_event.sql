-- Dennis Nwanevu Chong Ochulor - 22472393
-- Creates the Event table

DROP TABLE IF EXISTS Event; -- ensure no duplicates

-- create the table
CREATE TABLE Event(
	sport_id CHAR(3),
	category VARCHAR(40),
	stage VARCHAR(40),
	start_date DATETIME,
	end_date DATETIME,
	e_type CHAR(1) NOT NULL,
	venue_id CHAR(3),
	PRIMARY KEY(sport_id,category,stage),
	FOREIGN KEY (sport_id) REFERENCES Sport(sport_id),
	FOREIGN KEY (venue_id) REFERENCES Venue(venue_id),
	CHECK ((end_date IS NULL) OR (end_date >= start_date)),
	CHECK (e_type IN ('I','T'))
);

