-- Dennis Nwanevu Chong Ochulor - 22472393
-- Creates the Country table

DROP TABLE IF EXISTS Country; -- ensure no duplicates

-- create the table
CREATE TABLE Country(
	country_id CHAR(3) PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

