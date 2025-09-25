-- Dennis Nwanevu Chong Ochulor - 22472393
-- Q2: Who are the youngest and oldest athletes in the Olympics 2024?

SELECT participant_id, name, gender, DATE_FORMAT(birthdate, '%e %M, %Y') AS birthdate,
TIMESTAMPDIFF(YEAR,birthdate,CURDATE()) AS Age FROM Athlete
WHERE birthdate = (SELECT MAX(birthdate) FROM Athlete) -- to get the youngest
OR birthdate = (SELECT MIN(birthdate) FROM Athlete); -- to get the oldest 
