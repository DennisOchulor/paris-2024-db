-- Dennis Nwanevu Chong Ochulor - 22472393
-- Creates the Participant table

DROP TABLE IF EXISTS Participant; -- ensure no duplicates

-- create the table
CREATE TABLE Participant(
	participant_id VARCHAR(17) PRIMARY KEY,
	p_type CHAR(1) NOT NULL,
	country_id CHAR(3) NOT NULL,
	FOREIGN KEY (country_id) REFERENCES Country(country_id),
	CHECK (p_type IN ('A','T'))
);

