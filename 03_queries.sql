-- 03_queries.sql

USE airline_db;

-- READ + JOIN: Yanice Murangwa Shami (Query lead)
-- READ: passengers in Business or First
SELECT passenger_id, name, class_tier
FROM passengers
WHERE class_tier IN ('Business', 'First');

-- UPDATE + DELETE: Vainqueur Ishimwe (QA)

