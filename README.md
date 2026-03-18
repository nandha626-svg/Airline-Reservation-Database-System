#  Airline Reservation Database System

> A fully normalized relational database system for managing airline operations — flights, passengers, bookings, crew, and analytics.

**University:** The University of Texas at Dallas  
**Course:** BUAN 6320 — Database Foundations for Business Analytics | Fall 2024  
**Instructor:** Prof. Kannan Srikanth  
**Team (Group 7):** Bhoomi Parikh · Sai Nischala Kuchibhotla · Vamsi Krishna Kovi · Nandhakumar Sivakumar · Harsha Vardhana Reddy Diddala

---

##  Overview

The **Airline Database Management System (ADMS)** is a centralized solution designed to streamline the management of airline operations. It automates key processes, ensures data accuracy, and enhances decision-making for airline management.

The system organizes critical information including:
- Flight schedules & route management
- Passenger records & loyalty tracking
- Reservation and booking management
- Crew assignments
- Real-time satisfaction analytics

---

##  Database Schema — 20 Tables

| # | Table | Description |
|---|-------|-------------|
| 1 | `Passengers` | Passenger demographics and travel preferences |
| 2 | `Flights` | Flight schedules, airports, and distances |
| 3 | `Bookings` | Passenger bookings linked to flights and seat classes |
| 4 | `Airlines` | Airline company details |
| 5 | `Airports` | Airport details with IATA codes |
| 6 | `FlightStatus` | Current flight status (On Time, Delayed, Cancelled) |
| 7 | `Crew` | Crew member positions and airline assignments |
| 8 | `Luggage` | Passenger luggage weight and type |
| 9 | `Meals` | In-flight meal options and pricing |
| 10 | `Ratings` | Passenger ratings (food, service, comfort) |
| 11 | `Promotions` | Discount offers and validity periods |
| 12 | `PaymentMethods` | Available payment methods |
| 13 | `Payments` | Payment details and amounts per booking |
| 14 | `Satisfaction` | Passenger satisfaction levels per flight |
| 15 | `FrequentFlyer` | Frequent flyer miles and tier levels |
| 16 | `CancelledFlights` | Flight cancellation details and reasons |
| 17 | `RouteDetails` | Route distances and descriptions |
| 18 | `FlightReviews` | Passenger reviews and ratings |
| 19 | `CheckIn` | Check-in details and methods |
| 20 | `PromotionsDetails` | Alternate promotional offer structures |

---

##  Complex Queries (10)

| # | Query | Purpose |
|---|-------|---------|
| 1 | Top 5 routes by customer satisfaction | Identify highest-performing routes |
| 2 | Flight distance + delay vs satisfaction | Understand how delays affect ratings |
| 3 | Loyal vs disloyal customers across travel types | Compare behavior by customer segment |
| 4 | Most popular routes by frequent flyer tier | Loyalty program usage patterns |
| 5 | Age group vs satisfaction across seat classes | Demographic preference analysis |
| 6 | Average ratings by customer type | Service quality by segment |
| 7 | Flights with highest dissatisfaction rates | Flag underperforming flights |
| 8 | Flight distance impact on satisfaction | Operational insights |
| 9 | Total luggage weight by seat class & flight | Baggage and logistics planning |
| 10 | Most common low-rated service combinations | Targeted service improvements |

---

##  Stored Procedures (5)

```sql
-- 1. Calculate overall satisfaction score for a specific flight
CALL CalculateFlightSatisfaction(flightID, @score);

-- 2. Retrieve satisfaction history for a passenger
CALL GetPassengerSatisfactionHistory(passengerID);

-- 3. Generate satisfaction report for a date range
CALL GenerateSatisfactionReport(startDate, endDate);

-- 4. Identify frequent complainers above a threshold
CALL IdentifyFrequentComplainers(complaintThreshold);

-- 5. Auto-update customer type based on flight frequency
CALL UpdateCustomerType();
```

---

##  Stored Functions (5)

```sql
-- 1. Calculate customer loyalty score
SELECT CalculateCustomerLoyaltyScore(passengerID);

-- 2. Determine passenger tier (Bronze / Silver / Gold / Platinum)
SELECT DeterminePassengerTier(loyaltyScore);

-- 3. Calculate flight punctuality percentage
SELECT CalculateFlightPunctuality(flightID);

-- 4. Get the busiest day of the week for flights
SELECT GetBusiestDayOfWeek();
```

---

##  Triggers (5)

| # | Trigger | Event | Purpose |
|---|---------|-------|---------|
| 1 | `UpdateCustomerTypeAfterBooking` | AFTER INSERT on Bookings | Auto-label loyal vs disloyal customers |
| 2 | `AddCancellationToReviews` | AFTER INSERT on CancelledFlights | Log cancellation reason in reviews |
| 3 | `PreventBookingOnCancelledFlights` | BEFORE INSERT on Bookings | Block bookings on cancelled flights |
| 4 | `PreventDuplicateFlightReview` | BEFORE INSERT on FlightReviews | Enforce one review per passenger per flight |
| 5 | `UpdateFrequentTravelerStatus` | AFTER INSERT on Bookings | Promote to "Frequent Traveler" after 10 bookings |

---

##  Getting Started

### Prerequisites
- MySQL 8.0+ or compatible RDBMS
- MySQL Workbench (recommended) or any SQL client

### Setup

**1. Clone the repository**
```bash
git clone https://github.com/YOUR_USERNAME/airline-database-system.git
cd airline-database-system
```

**2. Run the SQL script**
```bash
mysql -u root -p < AirlineDatabaseSystem.sql
```

Or inside MySQL Workbench:
```sql
SOURCE AirlineDatabaseSystem.sql;
```

**3. Verify the setup**
```sql
USE AirlineDB;
SHOW TABLES;
-- Should list all 20 tables
```

---

##  Project Structure

```
airline-database-system/
│
├── AirlineDatabaseSystem.sql        # Full DB: schema + data + procedures + triggers
├── README.md                        # Project documentation
└── .gitignore
```

---

##  Key Features

-  Fully normalized relational schema
-  ER Diagram with all entity relationships
-  Data Dictionary for all 20 tables
-  10 complex analytical queries with results
-  5 Stored Procedures for business automation
-  5 Stored Functions for reusable computations
-  5 Triggers for data integrity enforcement
-  Seed data included for all tables

---

##  Future Enhancements

- Real-time flight tracking integration
- Web dashboard for operational analytics
- Machine learning for demand forecasting
- Mobile check-in API integration

---

##  Team Members

| Name | Student ID |
|------|-----------|
| Bhoomi Parikh | BBP240001 |
| Sai Nischala Kuchibhotla | SXK230312 |
| Vamsi Krishna Kovi | VXK240023 |
| Nandhakumar Sivakumar | NXS230144 |
| Harsha Vardhana Reddy Diddala | HVD240000 |

---

> *BUAN 6320 — Database Foundations for Business Analytics | Fall 2024 | UT Dallas*
