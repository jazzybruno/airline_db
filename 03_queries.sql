-- 03_queries.sql

USE airline_db;

-- READ + JOIN: Yanice Murangwa Shami (Query lead)
-- READ: passengers in Business or First
SELECT passenger_id, name, class_tier
FROM passengers
WHERE class_tier IN ('Business', 'First');

-- JOIN: one ticket per booking; passengers without a booking do not show up
SELECT p.name        AS Name,
       b.destination AS Destination,
       p.class_tier  AS Tier,
       CASE
           WHEN p.class_tier = 'Economy' THEN 'No perks'
           ELSE CONCAT_WS(', ', p.lounge_pass, p.suite, p.chauffeur)
       END           AS Perks
FROM passengers p
INNER JOIN bookings b ON b.passenger_id = p.passenger_id;

-- UPDATE + DELETE: Vainqueur Ishimwe (QA)

