-- Dennis Nwanevu Chong Ochulor - 22472393
-- To demonstrate that the integrity constraints are enforced properly
-- Each of the following insert statements will FAIL:

INSERT INTO Athlete VALUES('1001','Henry Bergensten','M',172,70,'2001-09-09'); -- invalid participant_id
INSERT INTO Event(sport_id,category,stage,e_type) VALUES('AAA','Men','Final','T'); -- invalid sport_id
INSERT INTO Participant VALUES('WPOMTEAM734-ESP01','T','AAA'); -- invalid country_id
INSERT INTO Participate VALUES('ARCXTEAM2---USA01', 'ARC', 'Mixed Team', 'Gold Medal Match', '6', 'SETS', 'W', NULL, 'Q'); -- invalid medal value
INSERT INTO Participate VALUES('ARCXTEAM2---KOR01', 'ARC', 'Mixed Team', 'Gold Medal Match', '6', 'SETS', 'W', NULL, 'G'); -- duplicate entry
