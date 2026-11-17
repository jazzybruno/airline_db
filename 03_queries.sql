-- 03_queries.sql

-- READ + JOIN: Yanice Murangwa Shami (Query lead)


-- UPDATE + DELETE: Vainqueur Ishimwe (QA)

-- UPDATE: change seat_preference for a specific passenger by ID
UPDATE passengers
SET seat_preference = 'aisle'
WHERE passenger_id = 2;

-- UPDATE: change the destination of a specific passenger's booking by ID
UPDATE bookings
SET destination = 'Nairobi'
WHERE passenger_id = 2;

-- DELETE: remove a passenger's booking (the child row), so the foreign key
-- on bookings.passenger_id is never left pointing at a missing passenger
DELETE FROM bookings
WHERE passenger_id = 4;

-- Proof the delete kept the constraints intact: passenger 4 still exists,
-- only the booking row is gone
SELECT p.passenger_id, p.name, b.booking_id
FROM passengers p
LEFT JOIN bookings b ON b.passenger_id = p.passenger_id
WHERE p.passenger_id = 4;

