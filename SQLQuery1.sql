create database hotels;
use hotels;

select * from dbo.clean_table
-- Average Daily Rate (ADR) by Hotel Type
SELECT hotel, AVG(adr) AS average_adr
INTO avg_adr_by_hotel
FROM clean_table
GROUP BY hotel;

-- Booking Cancellations by Market Segment
SELECT market_segment, COUNT(*) AS num_cancellations
INTO cancellations_by_market_segment
FROM clean_table
WHERE is_canceled = 1
GROUP BY market_segment;

-- Special Requests by Hotel Type
SELECT hotel, AVG(total_of_special_requests) AS avg_special_requests
INTO special_requests_by_hotel
FROM clean_table
GROUP BY hotel;

-- Guest Distribution by Country
SELECT country, COUNT(*) AS num_guests
INTO guest_distribution_by_country
FROM clean_table
GROUP BY country
ORDER BY num_guests DESC;

-- Average Lead Time by Market Segment
SELECT market_segment, AVG(lead_time) AS average_lead_time
INTO avg_lead_time_by_market_segment
FROM clean_table
GROUP BY market_segment;

-- Cancellation Rate by Hotel Type
SELECT hotel, 
       SUM(is_canceled) * 100.0 / COUNT(*) AS cancellation_rate
INTO cancellation_rate_by_hotel
FROM clean_table
GROUP BY hotel;

-- Repeated Guests by Hotel Type
SELECT hotel, SUM(is_repeated_guest) AS num_repeated_guests
INTO repeated_guests_by_hotel
FROM clean_table
GROUP BY hotel;

-- Distribution of Reserved Room Types
SELECT reserved_room_type, COUNT(*) AS num_reservations
INTO reserved_room_type_distribution
FROM clean_table
GROUP BY reserved_room_type;

-- Revenue Analysis by Customer Type
SELECT customer_type, SUM(adr) AS total_revenue
INTO revenue_by_customer_type
FROM clean_table
GROUP BY customer_type;

-- Parking Space Requests by Hotel Type
SELECT hotel, AVG(required_car_parking_spaces) AS avg_parking_spaces
INTO parking_space_requests_by_hotel
FROM clean_table
GROUP BY hotel;

