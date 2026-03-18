-- ============================================================
-- Airline Database System — Complex Analytical Queries
-- BUAN 6320 | UT Dallas | Fall 2024 | Group 7
-- ============================================================

-- -----------------------------------------------
-- Query 1: Top 5 routes with highest satisfaction
-- -----------------------------------------------
SELECT
    f.DepartureAirport,
    f.ArrivalAirport,
    AVG(CASE WHEN s.SatisfactionLevel = 'Satisfied' THEN 1 ELSE 0 END) AS SatisfactionRate,
    COUNT(*) AS TotalPassengers
FROM Flights f
JOIN Satisfaction s ON f.FlightID = s.FlightID
GROUP BY f.DepartureAirport, f.ArrivalAirport
ORDER BY SatisfactionRate DESC
LIMIT 5;

-- -----------------------------------------------
-- Query 2: Impact of flight distance & delay on satisfaction
-- -----------------------------------------------
SELECT
    CASE
        WHEN f.FlightDistance < 1000 THEN 'Short'
        WHEN f.FlightDistance BETWEEN 1000 AND 5000 THEN 'Medium'
        ELSE 'Long'
    END AS DistanceCategory,
    fs.Status AS DelayStatus,
    COUNT(s.SatisfactionLevel) AS TotalPassengers,
    AVG(CASE WHEN s.SatisfactionLevel = 'Satisfied' THEN 1 ELSE 0 END) * 100 AS SatisfactionRate
FROM Flights f
JOIN FlightStatus fs ON f.FlightID = fs.FlightID
JOIN Satisfaction s ON f.FlightID = s.FlightID
GROUP BY DistanceCategory, DelayStatus
ORDER BY DistanceCategory, DelayStatus;

-- -----------------------------------------------
-- Query 3: Satisfaction rates: loyal vs disloyal customers by travel type
-- -----------------------------------------------
SELECT
    p.CustomerType,
    p.TypeOfTravel,
    AVG(CASE WHEN s.SatisfactionLevel = 'Satisfied' THEN 1 ELSE 0 END) AS SatisfactionRate,
    COUNT(*) AS TotalPassengers
FROM Passengers p
JOIN Satisfaction s ON p.PassengerID = s.PassengerID
GROUP BY p.CustomerType, p.TypeOfTravel
ORDER BY p.CustomerType, p.TypeOfTravel;

-- -----------------------------------------------
-- Query 4: Most popular routes by frequent flyer tier
-- -----------------------------------------------
SELECT
    ff.TierLevel,
    CONCAT(f.DepartureAirport, ' to ', f.ArrivalAirport) AS Route,
    COUNT(b.BookingID) AS TotalBookings
FROM FrequentFlyer ff
JOIN Passengers p ON ff.PassengerID = p.PassengerID
JOIN Bookings b ON p.PassengerID = b.PassengerID
JOIN Flights f ON b.FlightID = f.FlightID
GROUP BY ff.TierLevel, Route
ORDER BY ff.TierLevel DESC, TotalBookings DESC
LIMIT 10;

-- -----------------------------------------------
-- Query 5: Age group vs satisfaction across seat classes
-- -----------------------------------------------
SELECT
    CASE
        WHEN p.Age < 20 THEN 'Under 20'
        WHEN p.Age BETWEEN 20 AND 40 THEN '20-40'
        WHEN p.Age BETWEEN 41 AND 60 THEN '41-60'
        ELSE 'Over 60'
    END AS AgeGroup,
    b.SeatClass,
    AVG(CASE WHEN s.SatisfactionLevel = 'Satisfied' THEN 1 ELSE 0 END) AS SatisfactionRate,
    COUNT(*) AS TotalPassengers
FROM Passengers p
JOIN Satisfaction s ON p.PassengerID = s.PassengerID
JOIN Bookings b ON s.FlightID = b.FlightID
GROUP BY AgeGroup, b.SeatClass
ORDER BY AgeGroup, b.SeatClass;

-- -----------------------------------------------
-- Query 6: Average ratings by customer type
-- -----------------------------------------------
SELECT
    p.CustomerType,
    AVG(r.FoodRating) AS AvgFoodRating,
    AVG(r.ServiceRating) AS AvgServiceRating,
    AVG(r.ComfortRating) AS AvgComfortRating
FROM Passengers p
JOIN Bookings b ON p.PassengerID = b.PassengerID
JOIN Ratings r ON b.BookingID = r.BookingID
GROUP BY p.CustomerType;

-- -----------------------------------------------
-- Query 7: Flights with highest dissatisfaction rates
-- -----------------------------------------------
SELECT
    f.FlightID,
    b.SeatClass,
    f.FlightDistance,
    COUNT(*) AS TotalPassengers,
    AVG(CASE WHEN s.SatisfactionLevel = 'Neutral or Dissatisfied' THEN 1.0 ELSE 0 END) AS DissatisfactionRate
FROM Flights f
JOIN Satisfaction s ON f.FlightID = s.FlightID
JOIN Bookings b ON f.FlightID = b.FlightID
GROUP BY f.FlightID, b.SeatClass, f.FlightDistance
ORDER BY DissatisfactionRate DESC
LIMIT 10;

-- -----------------------------------------------
-- Query 8: Flight distance impact on satisfaction by customer type
-- -----------------------------------------------
SELECT
    p.CustomerType,
    CASE
        WHEN f.FlightDistance < 500 THEN 'Short'
        WHEN f.FlightDistance BETWEEN 500 AND 2000 THEN 'Medium'
        ELSE 'Long'
    END AS FlightDistanceCategory,
    AVG(CASE WHEN s.SatisfactionLevel = 'Satisfied' THEN 1 ELSE 0 END) AS SatisfactionRate
FROM Passengers p
JOIN Satisfaction s ON p.PassengerID = s.PassengerID
JOIN Flights f ON s.FlightID = f.FlightID
GROUP BY p.CustomerType, FlightDistanceCategory
ORDER BY p.CustomerType, FlightDistanceCategory;

-- -----------------------------------------------
-- Query 9: Total luggage weight by seat class and flight
-- -----------------------------------------------
SELECT
    f.FlightNumber,
    b.SeatClass,
    SUM(l.Weight) AS TotalLuggageWeight
FROM Flights f
JOIN Bookings b ON f.FlightID = b.FlightID
JOIN Luggage l ON b.BookingID = l.BookingID
GROUP BY f.FlightNumber, b.SeatClass
ORDER BY f.FlightNumber, TotalLuggageWeight DESC;

-- -----------------------------------------------
-- Query 10: Most common combinations of low-rated services
-- -----------------------------------------------
SELECT
    m.MealName AS FoodType,
    CASE WHEN r.FoodRating < 3 THEN 1 ELSE 0 END AS LowFoodRating,
    CASE WHEN r.ServiceRating < 3 THEN 1 ELSE 0 END AS LowServiceRating,
    CASE WHEN r.ComfortRating < 3 THEN 1 ELSE 0 END AS LowComfortRating,
    COUNT(*) AS Occurrences
FROM Ratings r
JOIN Bookings b ON r.BookingID = b.BookingID
JOIN Meals m ON b.BookingID = m.MealID
GROUP BY FoodType, LowFoodRating, LowServiceRating, LowComfortRating
ORDER BY Occurrences DESC
LIMIT 10;
