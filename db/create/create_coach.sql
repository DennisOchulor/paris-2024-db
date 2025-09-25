-- Dennis Nwanevu Chong Ochulor - 22472393
-- Creates the Coach table

DROP TABLE IF EXISTS Coach; -- ensure no duplicates

-- create the table
CREATE TABLE Coach(
	coach_id CHAR(7) PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	gender CHAR(1) NOT NULL,
	func VARCHAR(30),
	birthdate DATE,
	country_id CHAR(3) NOT NULL,
	head_coach_id CHAR(7),
	FOREIGN KEY (country_id) REFERENCES Country(country_id),
	FOREIGN KEY (head_coach_id) REFERENCES Coach(coach_id),
	CHECK (gender IN ('M','F'))
);

