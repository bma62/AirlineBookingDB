#1
# Select those clients who are in the booking list and rank them by their points
SELECT c.username, c.points
FROM Client c, Booking b
WHERE c.username = b.username
GROUP BY c.username, c.points
ORDER BY c.points DESC;

#2
# find the flight schedule with seats currently available
SELECT f.flightNo, fs.departureWeekday, fs.arrivalWeekday, fs.departureTime, fs.arrivalTime, (f.totalNumSeats - f.numSeatsSold) AS seatsAvailable
FROM FlightSchedule fs, Flight f 
WHERE f.flightNo = fs.flightNo
GROUP BY f.flightNo, fs.departureWeekday, fs.arrivalWeekday, fs.departureTime, fs.arrivalTime, f.numSeatsSold,seatsAvailable
ORDER By seatsAvailable ASC;

#3
# Given a passenger name, find the confirmation number, bookingStatus and transactionDate related to a passenger
SELECT confirmationNo, bookingStatus, transactionDate
FROM Booking
WHERE confirmationNo IN (SELECT confirmationNo
						FROM Ticket 
                        WHERE travelDocument IN (SELECT travelDocument
												FROM Passenger
                                                WHERE firstName= 'Libby' AND lastName='Gallagher'));
											
#4
#Related passengers with clients, tell which passengers a client booked a ticket for
SELECT c.username, b.confirmationNo, b.bookingStatus, t.ticketNo, p.firstName AS passengerFName, p.lastName AS passengerLName
FROM Passenger p, Client c, Booking b, Ticket t
WHERE c.username = b.username
		AND b.confirmationNo = t.confirmationNo
        AND t.travelDocument = p.travelDocument
GROUP BY c.username, b.confirmationNo, b.bookingStatus, t.ticketNo, passengerFName, passengerLName
ORDER BY c.username;

#5
#Find the most popular booking route ( tickets sold most), and its ticket price for a user
SELECT t.flightNo, COUNT(t.flightNo) AS numTicketSold,fs.departureAirportIATA, fs.arrivalAirportIATA, fs.seatPrice
FROM Ticket t, FlightSchedule fs
WHERE fs.flightNo = t.flightNo      
GROUP BY t.flightNo, fs.departureAirportIATA, fs.arrivalAirportIATA
ORDER BY numTicketSold DESC;


#6
#Rank the flight who takes the longest distance route between a time period
SELECT DISTINCT fs.flightNo, r.distance , fs.departureAirportIATA, fs.arrivalAirportIATA, f.departureDate, f.arrivalDate
FROM  Route r, FlightSchedule fs, Flight f
WHERE r.departureAirportIATA = fs.departureAirportIATA
		AND r.arrivalAirportIATA = fs.arrivalAirportIATA
        AND fs.flightNo = f.flightNo
        AND f.departureDate >= '2020-05-03' AND f.departureDate <= '2020-05-06'
GROUP BY fs.flightNo, fs.departureAirportIATA, fs.arrivalAirportIATA, f.departureDate, f.arrivalDate
ORDER BY  r.distance DESC;

#another possible solution to 6
SELECT fs.*, r.distance
FROM FlightSchedule fs, Route r
WHERE EXISTS (
		SELECT DISTINCT flightNo
		FROM Flight
		WHERE departureDate >= '2020-05-03' 
			AND departureDate <= '2020-05-06'
			AND fs.flightNo = Flight.flightNo)
    AND fs.departureAirportIATA = r.departureAirportIATA
    AND fs.arrivalAirportIATA = r.arrivalAirportIATA
    AND r.distance = (
		SELECT MAX(r.distance)
		FROM FlightSchedule fs, Route r
		WHERE flightNo IN (
			SELECT DISTINCT flightNo
			FROM Flight 
			WHERE departureDate >= '2020-05-03' 
				AND departureDate <= '2020-05-06')
				AND fs.departureAirportIATA = r.departureAirportIATA
				AND fs.arrivalAirportIATA = r.arrivalAirportIATA);

                                                
			



