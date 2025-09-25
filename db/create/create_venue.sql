-- Dennis Nwanevu Chong Ochulor - 22472393
-- Creates the Venue table

DROP TABLE IF EXISTS Venue; -- ensure no duplicates

-- create the table
CREATE TABLE Venue(
	venue_id CHAR(3) PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	start_date DATETIME,
	end_date DATETIME,
	CHECK (start_date < end_date)
);

