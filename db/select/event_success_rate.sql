-- Dennis Nwanevu Chong Ochulor - 22472393
-- Q6: Of all the events each country participated in, what amount/percentage of those events yielded medals?

SELECT a.country_id, a.name,
(SELECT COUNT(DISTINCT sport_id, category) FROM Participate NATURAL JOIN Participant p WHERE a.country_id = p.country_id) AS NumOfEvents,
(SELECT COUNT(DISTINCT sport_id, category) FROM Participate NATURAL JOIN Participant p WHERE a.country_id = p.country_id AND medal IS NOT NULL) AS NumOfEventsWithMedals,

-- NumOfEventsWithMedals/NumofEvents*100 (repeat of what is above because the alias can't be directly referenced)
ROUND((SELECT COUNT(DISTINCT sport_id, category) FROM Participate NATURAL JOIN Participant p WHERE a.country_id = p.country_id AND medal IS NOT NULL)/
(SELECT COUNT(DISTINCT sport_id, category) FROM Participate NATURAL JOIN Participant p WHERE a.country_id = p.country_id)*100,2) AS SuccessRatePct

FROM Country a
HAVING NumOfEvents > 0
ORDER BY SuccessRatePct DESC;
