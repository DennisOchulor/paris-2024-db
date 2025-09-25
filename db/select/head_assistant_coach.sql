-- Dennis Nwanevu Chong Ochulor - 22472393
-- Q5: Who are the coaches and who are their assistants (if any)?

SELECT h.coach_id AS 'Coach ID', h.name AS 'Coach Name', h.func AS 'Coach Function', a.coach_id AS 'Assistant Coach ID', a.name AS 'Assistant Coach Name'
FROM Coach h LEFT OUTER JOIN Coach a ON h.coach_id = a.head_coach_id -- coaches with no assistants will still be displayed
ORDER BY h.coach_id;

