//variables storing user inputs during flight booking
var departure;
var arrival;
var travelDate;
var flexDays;
var flightNo;
var seatNo;
var seatPrice;

module.exports = {
    bookDeparturePage: (req, res) => {
        //generate query to get distinct airports that have departure flights
        let query =
            "SELECT DISTINCT a.* " +
            "FROM Flight f, FlightSchedule fs, Airport a " +
            "WHERE f.flightNo = fs.flightNo " +
            "AND fs.departureAirportIATA = a.airportIATA;";
        db.query
        (query, (err, result) => {
                if (err) {
                    return res.status(500).send(err);
                } else {
                    //render page and pass in query results
                    res.render('book-departure.ejs', {departureAirports: result});
                }
            }
        )
    },

    bookDeparture: (req, res) => {
        //get the airport IATA of the selected value in the datalist
        departure = req.body.departure.substr(0, req.body.departure.indexOf(','));
        res.redirect('/arrival');
    },

    bookArrivalPage: (req, res) => {
        var arrivalAirports;
        //query airports that can be arrived from the selected departure airport
        var query =
            "SELECT DISTINCT a.* " +
            "FROM FlightSchedule fs, Airport a " +
            "WHERE fs.departureAirportIATA = '" + departure + "' " +
            "AND fs.arrivalAirportIATA = a.airportIATA;"
        db.query
        (query, (err, result) => {
                if (err) {
                    return res.status(500).send(err);
                } else {
                    arrivalAirports = result;
                    //render page and pass in query results
                }
            }
        )

        //get arrival airports that sold most tickets from the departure airport in the past 30 days
        query =
            "SELECT fs.arrivalAirportIATA, a.city, a.country, " +
            "SUM(numSeatsSold) AS ticketsSold, FORMAT(AVG(fs.seatPrice),2) AS avgPrice " +
            "FROM FlightSchedule fs, Flight f, Airport a " +
            "WHERE fs.departureAirportIATA = '" + departure + "'" +
            "AND fs.arrivalAirportIATA = a.airportIATA " +
            "AND fs.flightNo = f.flightNo " +
            "AND f.departureDate BETWEEN DATE_SUB(CURDATE(),INTERVAL 30 DAY) AND CURDATE() " +
            "GROUP BY fs.arrivalAirportIATA, a.city, a.country " +
            "ORDER BY SUM(numSeatsSold) DESC;";
        db.query
        (query, (err, result) => {
                if (err) {
                    return res.status(500).send(err);
                } else {
                    //render page and pass in query results
                    res.render
                    ('book-arrival.ejs',
                        {
                            departure: departure,
                            arrivalAirports: arrivalAirports,
                            topDestinations: result
                        });
                }
            }
        )
    },

    bookArrival: (req, res) => {
        //get the airport IATA of the selected value in the datalist
        arrival = req.body.arrival.substr(0, req.body.arrival.indexOf(','));
        res.redirect('/date');
    },

    bookDatePage: (req, res) => {
        res.render('book-date.ejs', {departure: departure, arrival: arrival})
    },

    bookDate: (req, res) => {
        travelDate = req.body.travelDate;
        res.redirect('/search');
    },

    searchFlightPage: (req, res) => {
        //query available flights nad order by departure time
        let query =
            "SELECT a.airlineName, f.flightNo, fs.departureAirportIATA, fs.arrivalAirportIATA, " +
            "   f.departureDate, fs.departureTime, f.arrivalDate, fs.arrivalTime, " +
            "   (f.totalNumSeats - f.numSeatsSold) AS seatsAvailable, fs.seatPrice " +
            "FROM FlightSchedule fs, Flight f, Airline a " +
            "WHERE f.flightNo = fs.flightNo " +
            "AND f.departureDate = '" + travelDate + "' " +
            "AND fs.departureAirportIATA = '" + departure + "' " +
            "AND fs.arrivalAirportIATA = '" + arrival + "' " +
            "AND fs.airlineIATA = a.airlineIATA " +
            "ORDER BY departureTime ASC;";

        db.query
        (query, (err, result) => {
                if (err) {
                    return res.status(500).send(err);
                } else {
                    //render page and pass in query results
                    res.render
                    ('search-flight.ejs',
                        {
                            departure: departure,
                            arrival: arrival,
                            travelDate: travelDate,
                            flights: result
                        });
                }
            }
        )
    },

    searchSeatPage: (req, res) => {
        //get available seats on that flight
        flightNo = req.params.flightNo;
        let query =
            "SELECT a.airlineName, s.flightNo, s.departureDate, fs.departureTime, s.seatNo, s.seatStatus, fs.seatPrice " +
            "FROM Seat s, FlightSchedule fs, Airline a " +
            "WHERE s.flightNo = '" + flightNo + "' " +
            "AND s.flightNo = fs.flightNo " +
            "AND fs.airlineIATA = a.airlineIATA " +
            "AND s.departureDate = '" + travelDate + "' " +
            "AND s.seatStatus = 'Available' " +
            "ORDER BY s.seatNo;"

        db.query
        (query, (err, result) => {
                if (err) {
                    return res.status(500).send(err);
                } else {
                    //render page and pass in query results
                    res.render
                    ('search-seat.ejs',
                        {
                            departure: departure,
                            arrival: arrival,
                            travelDate: travelDate,
                            seats: result
                        });
                }
            }
        )
    },

    //TODO : finish find deal
    findDealPage: (req, res) => {
        //get form elements from the request
        travelDate = req.body.travelDate;
        flexDays = req.body.flexDays[0];
    },

    passengerInfoPage: (req, res) => {
        seatNo = req.params.seatNo;
        seatPrice = req.params.seatPrice;
        res.render('passenger-info.ejs',
            {
                departure: departure,
                arrival: arrival,
                travelDate: travelDate,
                flightNo: flightNo, seatNo: seatNo, price: seatPrice
            })
    },

    passengerInfo: (req, res) => {
        let fName = req.body.fName;
        let lName = req.body.lName;
        let travelDocument = req.body.travelDocument;
        let points = Math.round(seatPrice * 0.1);
        let username = req.session.user;
        //insert this new booking into the db
        var query =
            "INSERT INTO Booking (bookingStatus, numSeatsBooked, numPointsEarned, transactionDate, transactionAmount, username) " +
            "VALUES ('Booked', 1, " + points + ", curdate(), " + seatPrice + ", '"+username+"');";

        db.query(query, (err, result) => {
            if (err) return res.status(500).send(err);
        });

        //also, insert this passenger's info into db
        query =
            "INSERT INTO Passenger " +
            "VALUES ('" + travelDocument + "', " +
            "'" + fName + "', " +
            "'" + lName + "');";

        db.query
        (query, (err, result) => {
            if (err) {
                // error here simply means this passenger has booked with us before and it already in db
                // so just ignore
            }
        });

        //update the client's points earned from this booking
        query =
            "UPDATE Client " +
            "SET points = points + " + points + " "
        "WHERE username = '"+username+"';";

        db.query(query, (err, result) => {
            if (err) return res.status(500).send(err);
        });

        //increment 1 to num seats sold for that flight
        query =
            "UPDATE Flight " +
            "SET numSeatsSold = numSeatsSold + 1 " +
            "WHERE flightNo = '" + flightNo + "' " +
            "AND departureDate = '" + travelDate + "';";

        db.query(query, (err, result) => {
            if (err) return res.status(500).send(err);
        });

        //update the status for the sold seat
        query =
            "UPDATE Seat " +
            "SET seatStatus = 'Sold' " +
            "WHERE flightNo = '" + flightNo + "' " +
            "AND seatNo = '" + seatNo + "' " +
            "AND departureDate = '" + travelDate + "';"
        db.query(query, (err, result) => {
            if (err) return res.status(500).send(err);
        })

        // get the confirmationNo we just inserted for the new booking
        var confirmationNo;
        query =
            "SELECT MAX(confirmationNo) AS cn " +
            "FROM Booking " +
            "WHERE transactionDate = curdate() " +
            "AND username = '"+username+"';";

        db.query
        (query, (err, result) => {
            if (err) return res.status(500).send(err);
            confirmationNo = result[0].cn;

            //lastly, insert a new ticket into db
            query =
                "INSERT INTO Ticket (confirmationNo, travelDocument, seatNo, flightNo, departureDate) " +
                "VALUES (" + confirmationNo + ", '" + travelDocument + "', '" + seatNo + "', '" + flightNo + "', '" + travelDate + "');";
            db.query(query, (err, result) => {
                if (err) return res.status(500).send(err);
                //all operations done, redirect to home page
                res.redirect('/');
            });
        });
    }
}