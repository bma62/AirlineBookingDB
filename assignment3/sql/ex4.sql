# Booking data
INSERT INTO BOOKING 
	(bookingStatus, 
	numSeatsBooked,
    numPointsEarned, 
    transactionDate, 
    transactionAmount,
    username)
VALUES
	('Booked', '5', '500', '2020-11-20', '2500', 'bma62');

INSERT INTO BOOKING 
	(bookingStatus, 
	numSeatsBooked,
    numPointsEarned, 
    transactionDate, 
    transactionAmount,
    username)
VALUES
	('Cancelled', '1', '100', '2020-11-22', '500', 'ana83');

INSERT INTO BOOKING 
	(bookingStatus, 
	numSeatsBooked,
    numPointsEarned, 
    transactionDate, 
    transactionAmount,
    username)
VALUES
	('Completed', '2', '200', '2020-11-10', '1000', 'cary89');

INSERT INTO BOOKING 
	(bookingStatus, 
	numSeatsBooked,
    numPointsEarned, 
    transactionDate, 
    transactionAmount,
    username)
VALUES
	('Booked', '1', '100', '2020-11-23', '500', 'riley01');
    
INSERT INTO BOOKING 
	(bookingStatus, 
	numSeatsBooked,
    numPointsEarned, 
    transactionDate, 
    transactionAmount,
    username)
VALUES
	('Booked', '4', '400', '2020-11-22', '2000', 'spencer34');

#FlightSchedule data
INSERT INTO FlightSchedule 
VALUES 
	('AC001', 'YYZ', 'YXU', 
    'AC', 'Monday', '8:30', 'Monday', '10:30', '500');

INSERT INTO FlightSchedule 
VALUES 
	('AC002', 'YYZ', 'YXU', 
    'AC', 'Tuesday', '11:30', 'Tuesday', '13:30', '400');

INSERT INTO FlightSchedule 
VALUES 
	('AC003', 'YYZ', 'YXU', 
    'AC', 'Friday', '13:30', 'Friday', '15:30', '600');

INSERT INTO FlightSchedule 
VALUES 
	('AC004', 'YYZ', 'YYC', 
    'AC', 'Friday', '13:30', 'Friday', '15:30', '700');

INSERT INTO FlightSchedule 
VALUES 
	('AC005', 'YYZ', 'YYC', 
    'AC', 'Monday', '13:30', 'Monday', '15:30', '500');

# Flight data
INSERT INTO Flight
VALUES ('AC001', '2020-11-23', '2020-11-23', '100', '80');

INSERT INTO Flight
VALUES ('AC001', '2020-11-16', '2020-11-16', '100', '70');

INSERT INTO Flight 
VALUES ('AC003', '2020-11-20', '2020-11-20', '100', '95');

INSERT INTO Flight 
VALUES ('AC004', '2020-11-20', '2020-11-20', '100', '60');

INSERT INTO Flight 
VALUES ('AC005', '2020-11-23', '2020-11-23', '100', '70');

#Seat data 
INSERT INTO Seat
VALUES ('1A', 'Sold', 'AC001', '2020-11-23');

INSERT INTO Seat
VALUES ('1B', 'Sold', 'AC001', '2020-11-23');

INSERT INTO Seat
VALUES ('1C', 'Sold', 'AC001', '2020-11-23');

INSERT INTO Seat
VALUES ('1A', 'Sold', 'AC001', '2020-11-16');

INSERT INTO Seat
VALUES ('1B', 'Sold', 'AC001', '2020-11-16');

# Ticke data
INSERT INTO Ticket
	(confirmationNo,
    travelDocument,
    seatNo,
    flightNo,
    departureDate)
VALUES (1, 'M0001-1998', '1A', 'AC001', '2020-11-23');

INSERT INTO Ticket
	(confirmationNo,
    travelDocument,
    seatNo,
    flightNo,
    departureDate)
VALUES (1, '16991015-1423', '1B', 'AC001', '2020-11-23');

INSERT INTO Ticket
	(confirmationNo,
    travelDocument,
    seatNo,
    flightNo,
    departureDate)
VALUES (1, '16910606-5783', '1C', 'AC001', '2020-11-23');

INSERT INTO Ticket
	(confirmationNo,
    travelDocument,
    seatNo,
    flightNo,
    departureDate)
VALUES (4, '16910606-5783', '1A', 'AC001', '2020-11-16');

INSERT INTO Ticket
	(confirmationNo,
    travelDocument,
    seatNo,
    flightNo,
    departureDate)
VALUES (4, '16991015-1423', '1B', 'AC001', '2020-11-16');