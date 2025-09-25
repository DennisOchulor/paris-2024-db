-- Dennis Nwanevu Chong Ochulor - 22472393
-- Q1: What are the archery events at the Olympics 2024?

SELECT * FROM Event
WHERE sport_id = "ARC" -- code for archery
AND start_date BETWEEN '2024-07-30' AND '2024-08-04';
