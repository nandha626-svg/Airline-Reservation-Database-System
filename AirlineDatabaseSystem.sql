CREATE DATABASE IF NOT EXISTS AirlineDB;
USE AirlineDB;

-- Table 1: Passengers
CREATE TABLE IF NOT EXISTS Passengers (
    PassengerID INT PRIMARY KEY AUTO_INCREMENT,
    Gender VARCHAR(10),
    CustomerType VARCHAR(20),
    Age INT,
    TypeOfTravel VARCHAR(20)
);

INSERT INTO Passengers (Gender, CustomerType, Age, TypeOfTravel) VALUES
('Male', 'Loyal Customer', 35, 'Business travel'),
('Female', 'Disloyal Customer', 28, 'Personal Travel'),
('Male', 'Loyal Customer', 42, 'Business travel'),
('Female', 'Loyal Customer', 31, 'Personal Travel'),
('Male', 'Disloyal Customer', 25, 'Business travel'),
('Female', 'Loyal Customer', 39, 'Business travel'),
('Male', 'Loyal Customer', 50, 'Personal Travel'),
('Female', 'Disloyal Customer', 22, 'Personal Travel'),
('Male', 'Loyal Customer', 45, 'Business travel'),
('Female', 'Loyal Customer', 33, 'Personal Travel');

-- Table 2: Flights
CREATE TABLE IF NOT EXISTS Flights (
    FlightID INT PRIMARY KEY AUTO_INCREMENT,
    FlightNumber VARCHAR(10),
    DepartureAirport VARCHAR(50),
    ArrivalAirport VARCHAR(50),
    DepartureTime DATETIME,
    ArrivalTime DATETIME,
    FlightDistance INT
);

INSERT INTO Flights (FlightNumber, DepartureAirport, ArrivalAirport, DepartureTime, ArrivalTime, FlightDistance) VALUES
('FL001', 'New York', 'London', '2024-11-01 08:00:00', '2024-11-01 20:00:00', 5567),
('FL002', 'Paris', 'Tokyo', '2024-11-02 10:30:00', '2024-11-03 06:45:00', 9713),
('FL003', 'Los Angeles', 'Sydney', '2024-11-03 23:15:00', '2024-11-05 07:30:00', 12051),
('FL004', 'Dubai', 'Singapore', '2024-11-04 14:00:00', '2024-11-05 02:30:00', 5841),
('FL005', 'Chicago', 'Berlin', '2024-11-05 16:45:00', '2024-11-06 08:15:00', 6856),
('FL006', 'Mumbai', 'Hong Kong', '2024-11-06 01:30:00', '2024-11-06 09:45:00', 4009),
('FL007', 'Toronto', 'São Paulo', '2024-11-07 11:20:00', '2024-11-07 22:50:00', 8249),
('FL008', 'Seoul', 'Moscow', '2024-11-08 09:00:00', '2024-11-08 14:30:00', 6618),
('FL009', 'Amsterdam', 'Cape Town', '2024-11-09 22:30:00', '2024-11-10 11:45:00', 9644),
('FL010', 'Bangkok', 'San Francisco', '2024-11-10 03:15:00', '2024-11-10 23:30:00', 13294);

-- Table 3: Bookings
CREATE TABLE IF NOT EXISTS Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    PassengerID INT,
    FlightID INT,
    SeatClass VARCHAR(20),
    BookingDate DATE,
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);

INSERT INTO Bookings (PassengerID, FlightID, SeatClass, BookingDate) VALUES
(1, 1, 'Business', '2024-10-15'),
(2, 2, 'Economy', '2024-10-16'),
(3, 3, 'First Class', '2024-10-17'),
(4, 4, 'Economy', '2024-10-18'),
(5, 5, 'Business', '2024-10-19'),
(6, 6, 'Economy', '2024-10-20'),
(7, 7, 'Business', '2024-10-21'),
(8, 8, 'Economy', '2024-10-22'),
(9, 9, 'First Class', '2024-10-23'),
(10, 10, 'Economy', '2024-10-24');

-- Table 4: Airlines
CREATE TABLE IF NOT EXISTS Airlines (
    AirlineID INT PRIMARY KEY AUTO_INCREMENT,
    AirlineName VARCHAR(50),
    Country VARCHAR(50)
);

INSERT INTO Airlines (AirlineName, Country) VALUES
('SkyHigh Airways', 'United States'),
('EuroWings', 'Germany'),
('Pacific Flyers', 'Australia'),
('Emirates', 'United Arab Emirates'),
('Maple Leaf Air', 'Canada'),
('Dragon Airlines', 'China'),
('Samba Airways', 'Brazil'),
('Nordic Sky', 'Sweden'),
('Sahara Air', 'Egypt'),
('Kangaroo Airlines', 'Australia');

-- Table 5: Airports
CREATE TABLE IF NOT EXISTS Airports (
    AirportID INT PRIMARY KEY AUTO_INCREMENT,
    AirportName VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50),
    IATACode VARCHAR(3)
);

INSERT INTO Airports (AirportName, City, Country, IATACode) VALUES
('John F. Kennedy International Airport', 'New York', 'United States', 'JFK'),
('Heathrow Airport', 'London', 'United Kingdom', 'LHR'),
('Charles de Gaulle Airport', 'Paris', 'France', 'CDG'),
('Tokyo Haneda Airport', 'Tokyo', 'Japan', 'HND'),
('Dubai International Airport', 'Dubai', 'United Arab Emirates', 'DXB'),
('Los Angeles International Airport', 'Los Angeles', 'United States', 'LAX'),
('Frankfurt Airport', 'Frankfurt', 'Germany', 'FRA'),
('Hong Kong International Airport', 'Hong Kong', 'Hong Kong', 'HKG'),
('Singapore Changi Airport', 'Singapore', 'Singapore', 'SIN'),
('Sydney Airport', 'Sydney', 'Australia', 'SYD');

-- Table 6: FlightStatus
CREATE TABLE IF NOT EXISTS FlightStatus (
    StatusID INT PRIMARY KEY AUTO_INCREMENT,
    FlightID INT,
    Status VARCHAR(20),
    UpdateTime DATETIME,
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);

INSERT INTO FlightStatus (FlightID, Status, UpdateTime) VALUES
(1, 'On Time', '2024-11-01 07:30:00'),
(2, 'Delayed', '2024-11-02 10:00:00'),
(3, 'On Time', '2024-11-03 22:45:00'),
(4, 'Cancelled', '2024-11-04 12:00:00'),
(5, 'On Time', '2024-11-05 16:15:00'),
(6, 'Delayed', '2024-11-06 01:00:00'),
(7, 'On Time', '2024-11-07 10:50:00'),
(8, 'On Time', '2024-11-08 08:30:00'),
(9, 'Delayed', '2024-11-09 22:00:00'),
(10, 'On Time', '2024-11-10 02:45:00');

-- Table 7: Crew
CREATE TABLE IF NOT EXISTS Crew (
    CrewID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50),
    AirlineID INT,
    FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID)
);

INSERT INTO Crew (FirstName, LastName, Position, AirlineID) VALUES
('John', 'Smith', 'Pilot', 1),
('Emma', 'Johnson', 'Co-Pilot', 1),
('Michael', 'Brown', 'Flight Attendant', 2),
('Sophia', 'Lee', 'Flight Attendant', 2),
('William', 'Taylor', 'Pilot', 3),
('Olivia', 'Wilson', 'Co-Pilot', 3),
('James', 'Anderson', 'Flight Attendant', 4),
('Ava', 'Thomas', 'Flight Attendant', 4),
('Alexander', 'Martinez', 'Pilot', 5),
('Isabella', 'Garcia', 'Co-Pilot', 5);

-- Table 8: Luggage
CREATE TABLE IF NOT EXISTS Luggage (
    LuggageID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    Weight DECIMAL(5,2),
    LuggageType VARCHAR(20),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

INSERT INTO Luggage (BookingID, Weight, LuggageType) VALUES
(1, 23.5, 'Checked'),
(2, 18.7, 'Checked'),
(3, 30.0, 'Checked'),
(4, 15.2, 'Carry-on'),
(5, 22.8, 'Checked'),
(6, 10.5, 'Carry-on'),
(7, 28.3, 'Checked'),
(8, 17.9, 'Checked'),
(9, 35.0, 'Checked'),
(10, 12.4, 'Carry-on');

-- Table 9: Meals
CREATE TABLE IF NOT EXISTS Meals (
    MealID INT PRIMARY KEY AUTO_INCREMENT,
    MealName VARCHAR(50),
    MealType VARCHAR(20),
    Price DECIMAL(6,2)
);

INSERT INTO Meals (MealName, MealType, Price) VALUES
('Chicken Pasta', 'Regular', 15.99),
('Vegetarian Curry', 'Vegetarian', 14.99),
('Beef Steak', 'Regular', 18.99),
('Vegan Salad', 'Vegan', 12.99),
('Seafood Platter', 'Regular', 20.99),
('Gluten-free Sandwich', 'Gluten-free', 13.99),
('Kosher Meal', 'Kosher', 16.99),
('Halal Lamb', 'Halal', 17.99),
('Fruit Platter', 'Vegetarian', 10.99),
('Kids Meal', 'Regular', 9.99);

-- Table 10: Ratings
CREATE TABLE IF NOT EXISTS Ratings (
    RatingID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    OverallRating INT,
    FoodRating INT,
    ServiceRating INT,
    ComfortRating INT,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

INSERT INTO Ratings (BookingID, OverallRating, FoodRating, ServiceRating, ComfortRating) VALUES
(1, 4, 3, 5, 4),
(2, 3, 2, 4, 3),
(3, 5, 5, 5, 5),
(4, 2, 1, 3, 2),
(5, 4, 4, 4, 4),
(6, 3, 3, 4, 3),
(7, 5, 4, 5, 5),
(8, 3, 2, 3, 4),
(9, 4, 5, 4, 4),
(10, 2, 2, 3, 2);

-- Table 11: Promotions
CREATE TABLE IF NOT EXISTS Promotions (
    PromotionID INT PRIMARY KEY AUTO_INCREMENT,
    PromotionCode VARCHAR(20),
    Description TEXT,
    DiscountPercentage DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

INSERT INTO Promotions (PromotionCode, Description, DiscountPercentage, StartDate, EndDate) VALUES
('SUMMER2024', 'Summer Sale', 15.00, '2024-06-01', '2024-08-31'),
('WINTER2024', 'Winter Getaway', 20.00, '2024-12-01', '2025-02-28'),
('EARLYBIRD', 'Early Booking Discount', 10.00, '2024-01-01', '2024-12-31'),
('LASTMINUTE', 'Last Minute Deals', 25.00, '2024-11-01', '2024-11-30'),
('FAMILYPACK', 'Family Package Discount', 12.50, '2024-07-01', '2024-08-31'),
('BUSINESSCLASS', 'Business Class Upgrade', 30.00, '2024-09-01', '2024-11-30'),
('LOYALTYDISCOUNT', 'Loyal Customer Discount', 5.00, '2024-01-01', '2024-12-31'),
('GROUPSAVE', 'Group Booking Savings', 18.00, '2024-03-01', '2024-05-31'),
('SENIORTRAVEL', 'Senior Citizen Discount', 10.00, '2024-01-01', '2024-12-31'),
('STUDENTOFFER', 'Student Travel Offer', 15.00, '2024-08-01', '2024-09-30');

-- Table 12: PaymentMethods
CREATE TABLE IF NOT EXISTS PaymentMethods (
    PaymentMethodID INT PRIMARY KEY AUTO_INCREMENT,
    MethodName VARCHAR(50)
);

INSERT INTO PaymentMethods (MethodName) VALUES
('Credit Card'),
('Debit Card'),
('PayPal'),
('Bank Transfer'),
('Apple Pay'),
('Google Pay'),
('Cryptocurrency'),
('Gift Card'),
('Cash'),
('Airline Miles');

-- Table 13: Payments
CREATE TABLE IF NOT EXISTS Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    PaymentMethodID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATETIME,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    FOREIGN KEY (PaymentMethodID) REFERENCES PaymentMethods(PaymentMethodID)
);

INSERT INTO Payments (BookingID, PaymentMethodID, Amount, PaymentDate) VALUES
(1, 1, 1250.00, '2024-10-15 14:30:00'),
(2, 3, 750.50, '2024-10-16 10:15:00'),
(3, 2, 2500.00, '2024-10-17 09:45:00'),
(4, 1, 600.75, '2024-10-18 16:20:00'),
(5, 4, 1100.00, '2024-10-19 11:30:00'),
(6, 5, 850.25, '2024-10-20 13:10:00'),
(7, 1, 1800.00, '2024-10-21 15:45:00'),
(8, 2, 950.00, '2024-10-22 09:30:00'),
(9, 3, 1350.50, '2024-10-23 14:20:00'),
(10, 4, 700.75, '2024-10-24 11:55:00');

-- Table 14: Satisfaction
CREATE TABLE IF NOT EXISTS Satisfaction (
    SatisfactionID INT PRIMARY KEY AUTO_INCREMENT,
    FlightID INT,
    PassengerID INT,
    SatisfactionLevel VARCHAR(50),
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID),
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID)
);

INSERT INTO Satisfaction (FlightID, PassengerID, SatisfactionLevel) VALUES
(1, 1, 'Satisfied'),
(2, 2, 'Neutral or Dissatisfied'),
(3, 3, 'Satisfied'),
(4, 4, 'Neutral or Dissatisfied'),
(5, 5, 'Satisfied');

-- Table 15: FrequentFlyer
CREATE TABLE IF NOT EXISTS FrequentFlyer (
    FlyerID INT PRIMARY KEY AUTO_INCREMENT,
    PassengerID INT,
    AirlineID INT,
    FlyerMiles INT,
    TierLevel VARCHAR(20),
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID)
);

INSERT INTO FrequentFlyer (PassengerID, AirlineID, FlyerMiles, TierLevel) VALUES
(1, 1, 15000, 'Silver'),
(2, 2, 20000, 'Gold'),
(3, 3, 10000, 'Bronze'),
(4, 4, 25000, 'Platinum'),
(5, 5, 12000, 'Silver'),
(6, 6, 30000, 'Gold'),
(7, 7, 8000, 'Bronze'),
(8, 8, 18000, 'Silver'),
(9, 9, 22000, 'Gold'),
(10, 10, 27000, 'Platinum');

-- Table 16: CancelledFlights
CREATE TABLE IF NOT EXISTS CancelledFlights (
    CancellationID INT PRIMARY KEY AUTO_INCREMENT,
    FlightID INT,
    CancellationReason TEXT,
    CancelledBy VARCHAR(50),
    CancellationDate DATETIME,
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);

INSERT INTO CancelledFlights (FlightID, CancellationReason, CancelledBy, CancellationDate) VALUES
(1, 'Severe weather conditions', 'Airline', '2024-11-01 06:00:00'),
(2, 'Technical issues with aircraft', 'Maintenance', '2024-11-02 08:30:00'),
(3, 'Air traffic control restrictions', 'ATC', '2024-11-03 14:15:00'),
(4, 'Crew availability issues', 'Airline', '2024-11-04 10:45:00'),
(5, 'Security concerns at destination', 'Airport Authority', '2024-11-05 16:20:00');

-- Table 17: RouteDetails
CREATE TABLE IF NOT EXISTS RouteDetails (
    RouteID INT PRIMARY KEY AUTO_INCREMENT,
    FlightID INT,
    RouteDescription TEXT,
    Distance INT,
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);

INSERT INTO RouteDetails (FlightID, RouteDescription, Distance) VALUES
(1, 'New York to London', 5567),
(2, 'Paris to Tokyo', 9713),
(3, 'Los Angeles to Sydney', 12051),
(4, 'Dubai to Singapore', 5841),
(5, 'Chicago to Berlin', 6856),
(6, 'Mumbai to Hong Kong', 4009),
(7, 'Toronto to São Paulo', 8249),
(8, 'Seoul to Moscow', 6618),
(9, 'Amsterdam to Cape Town', 9644),
(10, 'Bangkok to San Francisco', 13294);

-- Table 18: FlightReviews
CREATE TABLE IF NOT EXISTS FlightReviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    PassengerID INT,
    FlightID INT,
    ReviewRating INT,
    ReviewComment TEXT,
    ReviewDate DATETIME,
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);

INSERT INTO FlightReviews (PassengerID, FlightID, ReviewRating, ReviewComment, ReviewDate) VALUES
(1, 1, 5, 'Great service and smooth journey.', '2024-11-01 10:30:00'),
(2, 2, 4, 'Good flight, but faced minor delays.', '2024-11-02 18:30:00'),
(3, 3, 3, 'Average flight, could be better.', '2024-11-03 06:00:00'),
(4, 4, 4, 'Comfortable seats and good food.', '2024-11-04 17:00:00'),
(5, 5, 5, 'Excellent flight experience.', '2024-11-05 19:30:00'),
(6, 6, 3, 'On-time but cramped seating.', '2024-11-06 14:00:00'),
(7, 7, 4, 'Nice staff and smooth journey.', '2024-11-07 12:00:00'),
(8, 8, 5, 'Premium service and great in-flight amenities.', '2024-11-08 20:00:00'),
(9, 9, 4, 'Good, minor turbulence though.', '2024-11-09 01:00:00'),
(10, 10, 3, 'Decent flight but check-in was slow.', '2024-11-10 11:00:00');

-- Table 19: CheckIn
CREATE TABLE IF NOT EXISTS CheckIn (
    CheckInID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    PassengerID INT,
    CheckInTime DATETIME,
    CheckInMethod VARCHAR(50),
    BoardingPassIssued BOOLEAN,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID)
);

INSERT INTO CheckIn (BookingID, PassengerID, CheckInTime, CheckInMethod, BoardingPassIssued) VALUES
(1, 1, '2024-11-01 06:30:00', 'Online', TRUE),
(2, 2, '2024-11-02 08:00:00', 'Counter', TRUE),
(3, 3, '2024-11-03 21:00:00', 'Kiosk', TRUE),
(4, 4, '2024-11-04 12:30:00', 'Online', TRUE),
(5, 5, '2024-11-05 14:30:00', 'Counter', TRUE),
(6, 6, '2024-11-06 09:00:00', 'Online', TRUE),
(7, 7, '2024-11-07 07:30:00', 'Kiosk', TRUE),
(8, 8, '2024-11-08 15:30:00', 'Counter', TRUE),
(9, 9, '2024-11-09 19:30:00', 'Online', TRUE),
(10, 10, '2024-11-10 06:30:00', 'Kiosk', TRUE);

-- Table 20: Promotions (Alternative structure if needed)
CREATE TABLE IF NOT EXISTS PromotionsDetails (
    PromotionID INT PRIMARY KEY AUTO_INCREMENT,
    PromotionName VARCHAR(50),
    Description TEXT,
    StartDate DATETIME,
    EndDate DATETIME,
    DiscountPercentage DECIMAL(5, 2)
);

INSERT INTO PromotionsDetails (PromotionName, Description, StartDate, EndDate, DiscountPercentage) VALUES
('Winter Sale', 'Special discount on winter flights', '2024-12-01', '2024-12-31', 15.00),
('Summer Bonanza', 'Exclusive summer promotion', '2024-06-01', '2024-06-30', 10.00),
('Holiday Special', 'Holiday season discount', '2024-12-15', '2024-12-25', 20.00),
('Weekend Getaway', 'Discount on weekend travel', '2024-05-01', '2024-05-31', 12.00),
('Festive Offer', 'Special festive season offer', '2024-11-01', '2024-11-30', 18.00),
('Early Bird', 'Discount for early bookings', '2024-01-01', '2024-01-31', 25.00),
('New Year Special', 'Discount for New Year bookings', '2024-12-31', '2025-01-01', 30.00),
('Student Discount', 'Discount for students', '2024-09-01', '2024-12-31', 10.00),
('Business Class Offer', 'Business class exclusive offer', '2024-11-15', '2024-12-15', 20.00),
('Family Package', 'Family travel discount', '2024-04-01', '2024-04-30', 15.00);

-- 10 Complex Queries:

-- 1. Find the top 5 routes with the highest customer satisfaction:
SELECT f.DepartureAirport, f.ArrivalAirport, 
       AVG(CASE WHEN s.SatisfactionLevel = 'Satisfied' THEN 1 ELSE 0 END) AS SatisfactionRate,
       COUNT(*) AS TotalPassengers
FROM Flights f
JOIN Satisfaction s ON f.FlightID = s.FlightID
GROUP BY f.DepartureAirport, f.ArrivalAirport
ORDER BY SatisfactionRate DESC
LIMIT 5;

-- 2. Analyze the Impact of Flight Distance and Delay on Satisfaction Rates

SELECT 
    CASE 
        WHEN f.FlightDistance < 1000 THEN 'Short'
        WHEN f.FlightDistance BETWEEN 1000 AND 5000 THEN 'Medium'
        ELSE 'Long'
    END AS DistanceCategory,
    fs.Status AS DelayStatus,
    COUNT(s.SatisfactionLevel) AS TotalPassengers,
    AVG(CASE WHEN s.SatisfactionLevel = 'Satisfied' THEN 1 ELSE 0 END) * 100 AS SatisfactionRate
FROM 
    Flights f
JOIN 
    FlightStatus fs ON f.FlightID = fs.FlightID
JOIN 
    Satisfaction s ON f.FlightID = s.FlightID
GROUP BY 
    DistanceCategory, DelayStatus
ORDER BY 
    DistanceCategory, DelayStatus;

-- 3. Compare satisfaction rates between loyal and disloyal customers across different travel types:
SELECT 
    p.CustomerType,
    p.TypeOfTravel,
    AVG(CASE WHEN s.SatisfactionLevel = 'Satisfied' THEN 1 ELSE 0 END) AS SatisfactionRate,
    COUNT(*) AS TotalPassengers
FROM Passengers p
JOIN Satisfaction s ON p.PassengerID = s.PassengerID
GROUP BY p.CustomerType, p.TypeOfTravel
ORDER BY p.CustomerType, p.TypeOfTravel;

-- 4. Find the Most Popular Routes by Frequent Flyer Tier
SELECT 
    ff.TierLevel,
    CONCAT(f.DepartureAirport, ' to ', f.ArrivalAirport) AS Route,
    COUNT(b.BookingID) AS TotalBookings
FROM 
    FrequentFlyer ff
JOIN 
    Passengers p ON ff.PassengerID = p.PassengerID
JOIN 
    Bookings b ON p.PassengerID = b.PassengerID
JOIN 
    Flights f ON b.FlightID = f.FlightID
GROUP BY 
    ff.TierLevel, Route
ORDER BY 
    ff.TierLevel DESC, TotalBookings DESC
LIMIT 10;

-- 5. Analyze the relationship between age groups and satisfaction across different seat classes:
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

-- 6. Calculate the average ratings for each service category by customer type:
SELECT 
    p.CustomerType,
    AVG(r.FoodRating) AS AvgFoodRating,
    AVG(r.ServiceRating) AS AvgServiceRating,
    AVG(r.ComfortRating) AS AvgComfortRating
FROM Passengers p
JOIN Bookings b ON p.PassengerID = b.PassengerID
JOIN Ratings r ON b.BookingID = r.BookingID
GROUP BY p.CustomerType;

-- 7. Identify flights with the highest dissatisfaction rates:
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

-- 8. Analyze the impact of flight distance on satisfaction for different customer types:
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

-- 9. Total Luggage Weight by Seat Class and Flight
SELECT 
    f.FlightNumber,
    b.SeatClass,
    SUM(l.Weight) AS TotalLuggageWeight
FROM 
    Flights f
JOIN 
    Bookings b ON f.FlightID = b.FlightID
JOIN 
    Luggage l ON b.BookingID = l.BookingID
GROUP BY 
    f.FlightNumber, b.SeatClass
ORDER BY 
    f.FlightNumber, TotalLuggageWeight DESC;


-- 10. Identify the most common combinations of low-rated services:
SELECT 
    m.MealName AS FoodType,
    CASE WHEN r.FoodRating < 3 THEN 1 ELSE 0 END AS LowFoodRating,
    CASE WHEN r.ServiceRating < 3 THEN 1 ELSE 0 END AS LowServiceRating,
    CASE WHEN r.ComfortRating < 3 THEN 1 ELSE 0 END AS LowComfortRating,
    COUNT(*) AS Occurrences
FROM 
    Ratings r
JOIN 
    Bookings b ON r.BookingID = b.BookingID
JOIN 
    Meals m ON b.BookingID = m.MealID  -- Assuming each booking has a meal
GROUP BY 
    FoodType, LowFoodRating, LowServiceRating, LowComfortRating
ORDER BY 
    Occurrences DESC
LIMIT 10;


-- 5 Stored Procedures:

-- 1. Calculate overall satisfaction score for a specific flight:
DELIMITER //
CREATE PROCEDURE CalculateFlightSatisfaction(IN flightID INT, OUT satisfactionScore DECIMAL(4,2))
BEGIN
    SELECT AVG(
        r.FoodRating + r.ServiceRating + r.ComfortRating + 
        IFNULL(r.OverallRating, 0)
    ) / 4 INTO satisfactionScore
    FROM Ratings r
    JOIN Bookings b ON r.BookingID = b.BookingID
    WHERE b.FlightID = flightID;
END //
DELIMITER ;

SELECT @satisfactionScore AS SatisfactionScore;

-- 2. Get passenger satisfaction history:
DELIMITER //
CREATE PROCEDURE GetPassengerSatisfactionHistory(IN passengerID INT)
BEGIN
    SELECT f.FlightID, b.SeatClass, s.SatisfactionLevel, f.DepartureTime
    FROM Flights f
    JOIN Satisfaction s ON f.FlightID = s.FlightID
    JOIN Bookings b ON s.PassengerID = b.PassengerID
    WHERE s.PassengerID = passengerID
    ORDER BY f.DepartureTime DESC;
END //
DELIMITER ;

CALL GetPassengerSatisfactionHistory(1);

-- 3. Generate satisfaction report for a specific date range:
DELIMITER //
CREATE PROCEDURE GenerateSatisfactionReport(IN startDate DATE, IN endDate DATE)
BEGIN
    SELECT 
        b.SeatClass,
        COUNT(*) AS TotalPassengers,
        AVG(CASE WHEN s.SatisfactionLevel = 'Satisfied' THEN 1 ELSE 0 END) AS SatisfactionRate,
        AVG(r.FoodRating) AS AvgFoodRating,
        AVG(r.ServiceRating) AS AvgServiceRating,
        AVG(r.ComfortRating) AS AvgComfortRating
    FROM Flights f
    JOIN Satisfaction s ON f.FlightID = s.FlightID
    JOIN Bookings b ON f.FlightID = b.FlightID
    JOIN Ratings r ON b.BookingID = r.BookingID
    WHERE DATE(f.DepartureTime) BETWEEN startDate AND endDate
    GROUP BY b.SeatClass
    ORDER BY SatisfactionRate DESC;
END //
DELIMITER ;

CALL GenerateSatisfactionReport('2024-11-01', '2024-11-10');

-- 4. Identify and report on frequent complainers:
DELIMITER //
CREATE PROCEDURE IdentifyFrequentComplainers(IN complaintThreshold INT)
BEGIN
    SELECT 
        p.PassengerID,
        p.CustomerType,
        COUNT(*) AS TotalFlights,
        SUM(CASE WHEN s.SatisfactionLevel = 'Neutral or Dissatisfied' THEN 1 ELSE 0 END) AS Complaints,
        AVG(
            r.FoodRating + r.ServiceRating + r.ComfortRating + 
            IFNULL(r.OverallRating, 0)
        ) / 4 AS AvgRating
    FROM Passengers p
    JOIN Satisfaction s ON p.PassengerID = s.PassengerID
    JOIN Bookings b ON s.FlightID = b.FlightID AND s.PassengerID = b.PassengerID
    JOIN Ratings r ON b.BookingID = r.BookingID
    GROUP BY p.PassengerID, p.CustomerType
    HAVING Complaints >= complaintThreshold
    ORDER BY Complaints DESC;
END //
DELIMITER ;

CALL IdentifyFrequentComplainers(3);

-- 5. Update customer type based on flight frequency:
DELIMITER //
CREATE PROCEDURE UpdateCustomerType()
BEGIN
    UPDATE Passengers p
    JOIN (
        SELECT PassengerID, COUNT(*) AS FlightCount
        FROM Bookings
        GROUP BY PassengerID
    ) b ON p.PassengerID = b.PassengerID
    SET p.CustomerType = 
        CASE
            WHEN b.FlightCount > 10 THEN 'Loyal Customer'
            ELSE 'Disloyal Customer'
        END;
END //
DELIMITER ;

CALL UpdateCustomerType();
SELECT * FROM Passengers;

-- 5 Functions:

-- 1. Calculate customer loyalty score:
DELIMITER //

CREATE FUNCTION CalculateCustomerLoyaltyScore(passengerID INT) 
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE loyaltyScore DECIMAL(10, 2);

    -- Calculate the loyalty score based on flight count, satisfaction level, and flight distance
    SELECT 
        COALESCE(COUNT(*) * 10, 0) + 
        COALESCE(SUM(CASE WHEN s.SatisfactionLevel = 'Satisfied' THEN 5 ELSE 0 END), 0) +
        COALESCE(SUM(f.FlightDistance / 100), 0) 
    INTO loyaltyScore
    FROM Satisfaction s
    JOIN Flights f ON s.FlightID = f.FlightID
    WHERE s.PassengerID = passengerID;

    RETURN loyaltyScore;
END //

DELIMITER ;

SELECT CalculateCustomerLoyaltyScore(1) AS LoyaltyScore;

-- 2. Determine passenger tier based on loyalty score:
DELIMITER //
CREATE FUNCTION DeterminePassengerTier(loyaltyScore INT) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE tier VARCHAR(20);
    
    IF loyaltyScore > 1000 THEN
        SET tier = 'Platinum';
    ELSEIF loyaltyScore > 500 THEN
        SET tier = 'Gold';
    ELSEIF loyaltyScore > 200 THEN
        SET tier = 'Silver';
    ELSE
        SET tier = 'Bronze';
    END IF;
    
    RETURN tier;
END //
DELIMITER ;

SELECT DeterminePassengerTier(550) AS Tier;



-- 3. Calculate flight punctuality percentage:
DELIMITER //
CREATE FUNCTION CalculateFlightPunctuality(flightID INT) 
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE totalFlights INT DEFAULT 0;
    DECLARE onTimeFlights INT DEFAULT 0;
    DECLARE punctualityPercentage DECIMAL(5,2);

    -- Assuming there is a column DepartureDelayMinutes in the FlightStatus table to check delay times
    SELECT COUNT(*) INTO totalFlights
    FROM FlightStatus
    WHERE FlightID = flightID;
    
    SELECT COUNT(*) INTO onTimeFlights
    FROM FlightStatus
    WHERE FlightID = flightID AND Status = 'On Time';
    
    SET punctualityPercentage = (onTimeFlights * 100.0) / GREATEST(totalFlights, 1);
    
    RETURN punctualityPercentage;
END //
DELIMITER ;

SELECT CalculateFlightPunctuality(1) AS PunctualityPercentage;



-- Triggers
-- 1 Update CustomerType Based on Total Flights Booked
DELIMITER //
CREATE TRIGGER UpdateCustomerTypeAfterBooking
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    DECLARE flight_count INT;

    -- Count the total bookings for the passenger
    SELECT COUNT(*) INTO flight_count
    FROM Bookings
    WHERE PassengerID = NEW.PassengerID;

    -- Update CustomerType based on the number of bookings
    IF flight_count > 10 THEN
        UPDATE Passengers
        SET CustomerType = 'Loyal Customer'
        WHERE PassengerID = NEW.PassengerID;
    ELSE
        UPDATE Passengers
        SET CustomerType = 'Disloyal Customer'
        WHERE PassengerID = NEW.PassengerID;
    END IF;
END;
//
DELIMITER ;

-- Insert a booking to test the trigger
INSERT INTO Bookings (PassengerID, FlightID, SeatClass, BookingDate) 
VALUES (1, 2, 'Business', '2024-11-12');

-- Verify if the `CustomerType` in `Passengers` table updated for PassengerID = 1
SELECT * FROM Passengers WHERE PassengerID = 1;

-- 2 Track CancellationReason in FlightReviews Table for Cancelled Flights
DELIMITER //
CREATE TRIGGER AddCancellationToReviews
AFTER INSERT ON CancelledFlights
FOR EACH ROW
BEGIN
    INSERT INTO FlightReviews (PassengerID, FlightID, ReviewRating, ReviewComment, ReviewDate)
    VALUES (NULL, NEW.FlightID, 1, CONCAT('Flight cancelled due to: ', NEW.CancellationReason), NEW.CancellationDate);
END;
//
DELIMITER ;

-- Insert a cancelled flight to test the trigger
INSERT INTO CancelledFlights (FlightID, CancellationReason, CancelledBy, CancellationDate) 
VALUES (6, 'Unexpected weather conditions', 'Airline', '2024-11-12 09:00:00');

-- Verify if a review was automatically added for the cancelled flight
SELECT * FROM FlightReviews WHERE FlightID = 6;

-- 3 Prevent Booking on Cancelled Flights
DELIMITER //
CREATE TRIGGER PreventBookingOnCancelledFlights
BEFORE INSERT ON Bookings
FOR EACH ROW
BEGIN
    DECLARE is_cancelled INT;

    -- Check if the flight is marked as cancelled in the CancelledFlights table
    SELECT COUNT(*) INTO is_cancelled
    FROM CancelledFlights
    WHERE FlightID = NEW.FlightID;

    -- If the flight is cancelled, prevent booking and raise an error
    IF is_cancelled > 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Booking on a cancelled flight is not allowed.';
    END IF;
END;
//
DELIMITER ;

-- Try to insert a booking for a cancelled flight to test the trigger
INSERT INTO Bookings (PassengerID, FlightID, SeatClass, BookingDate) 
VALUES (2, 6, 'Economy', '2024-11-15');
-- This should raise an error: "Booking on a cancelled flight is not allowed."

-- Try to insert a booking for a cancelled flight to test the trigger
INSERT INTO Bookings (PassengerID, FlightID, SeatClass, BookingDate) 
VALUES (2, 6, 'Economy', '2024-11-15');
-- This should raise an error: "Booking on a cancelled flight is not allowed."

-- 4 Prevent Duplicate Passenger Reviews for the Same Flight
DELIMITER //
CREATE TRIGGER PreventDuplicateFlightReview
BEFORE INSERT ON FlightReviews
FOR EACH ROW
BEGIN
    DECLARE review_count INT;

    -- Check if the passenger has already submitted a review for the flight
    SELECT COUNT(*) INTO review_count
    FROM FlightReviews
    WHERE PassengerID = NEW.PassengerID AND FlightID = NEW.FlightID;

    -- If a review already exists for this passenger and flight, prevent insertion and raise an error
    IF review_count > 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Duplicate review not allowed for the same passenger and flight.';
    END IF;
END;
//
DELIMITER ;

-- Insert a review for a specific passenger and flight
INSERT INTO FlightReviews (PassengerID, FlightID, ReviewRating, ReviewComment, ReviewDate) 
VALUES (3, 3, 5, 'Amazing service!', '2024-11-13');

-- Attempt to insert another review for the same passenger and flight
INSERT INTO FlightReviews (PassengerID, FlightID, ReviewRating, ReviewComment, ReviewDate) 
VALUES (3, 3, 4, 'Nice flight!');
-- This should raise an error: "Duplicate review not allowed for the same passenger and flight."

-- 5 Automatically Update Customer Type to "Frequent Traveler" After 10 Bookings
DELIMITER //
CREATE TRIGGER UpdateFrequentTravelerStatus
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    DECLARE booking_count INT;

    -- Count the total bookings for the passenger
    SELECT COUNT(*)
    INTO booking_count
    FROM Bookings
    WHERE PassengerID = NEW.PassengerID;

    -- If the passenger has 10 or more bookings, update CustomerType to "Frequent Traveler"
    IF booking_count >= 10 THEN
        UPDATE Passengers
        SET CustomerType = 'Frequent Traveler'
        WHERE PassengerID = NEW.PassengerID;
    END IF;
END;
//
DELIMITER ;

-- Insert multiple bookings for a single passenger to trigger frequent traveler status update
INSERT INTO Bookings (PassengerID, FlightID, SeatClass, BookingDate) 
VALUES (10, 7, 'Economy', '2024-11-10'),
       (10, 8, 'Business', '2024-11-11'),
       (10, 9, 'First Class', '2024-11-12'),
       (10, 10, 'Economy', '2024-11-13'),
       (10, 5, 'Business', '2024-11-14');

-- Verify if the `CustomerType` in `Passengers` table updated to "Frequent Traveler" for PassengerID = 10
SELECT * FROM Passengers WHERE PassengerID = 10;

use airlinedb;
show tables;
select * from airlines;
select * from airports;
select * from bookings;
select * from cancelledflights;
select * from checkin;
select * from crew;
select * from flightreviews;
select * from flights;
select * from flightstatus;
select * from frequentflyer;
select * from luggage;
select * from meals;
select * from passengers;
select * from paymentmethods;
select * from payments;
select * from promotions;
select * from promotionsdetails;
select * from ratings;
select * from routedetails;
select * from satisfaction;
