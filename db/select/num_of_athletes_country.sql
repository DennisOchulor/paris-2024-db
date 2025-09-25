-- Dennis Nwanevu Chong Ochulor - 22472393
-- Q4: How many athletes are there in each participating country?

SELECT Country.country_id, Country.name, count(*) AS NumOfAthletes
FROM Participant INNER JOIN Country ON Participant.country_id = Country.country_id
WHERE p_type = 'A' -- only athletes, exclude teams
GROUP BY Country.country_id
ORDER BY NumOfAthletes DESC; -- greatest number of athletes to smallest
