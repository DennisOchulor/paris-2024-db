-- Dennis Nwanevu Chong Ochulor - 22472393
-- Creates the Sport table

DROP TABLE IF EXISTS Sport; -- ensure no duplicates

-- create the table
CREATE TABLE Sport(
	sport_id CHAR(3) PRIMARY KEY,
	name VARCHAR(30) NOT NULL
);

