-- 01_schema.sql: Pacifique Mico (Driver)
-- CREATE DATABASE airline_db, passengers and bookings tables
DROP DATABASE IF EXISTS airline_db;
CREATE DATABASE airline_db;
USE airline_db;

-- one row per passenger; perks are NULL when the tier doesn't include them
CREATE TABLE passengers (
    passenger_id    INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    class_tier      ENUM('Economy', 'Business', 'First') NOT NULL,
    seat_preference VARCHAR(20),
    lounge_pass     VARCHAR(50) NULL,
    suite           VARCHAR(50) NULL,
    chauffeur       VARCHAR(50) NULL
);

-- each booking belongs to one passenger
CREATE TABLE bookings (
    booking_id   INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id INT NOT NULL,
    destination  VARCHAR(100) NOT NULL,
    travel_date  DATE NOT NULL,
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id)
);
