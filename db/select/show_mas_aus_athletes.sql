-- Dennis Nwanevu Chong Ochulor - 22472393
-- Q3: Who are the Malaysian and Australian athletes that participated in the Olympics 2024?

SELECT Athlete.participant_id, name, gender, country_id
FROM Participant NATURAL JOIN Athlete -- joins on common column participant_id
WHERE Participant.country_id IN ('MAS','AUS')
ORDER BY country_id;
