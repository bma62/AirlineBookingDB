//variables storing user inputs during flight booking
var departure;
var arrival;
var travelDate;
var flexDays;

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
                }
                else {
                    //render page and pass in query results
                    res.render('book-departure.ejs', { departureAirports: result });
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
                }
                else {
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
                }
                else {
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
        res.render('book-date.ejs', { departure: departure, arrival: arrival })
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
                }
                else {
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
        let flightNo = req.params.flightNo;
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
                }
                else {
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

    findDealPage: (req, res) => {
        //get form elements from the request
        travelDate = req.body.travelDate;
        flexDays = req.body.flexDays[0];
    },

    bookFlight: (req, res) => {
        let fName = req.body.fName;
        let lName = req.body.lName;
        let doc = req.body.doc;
        let numSeatsBooked = req.body.numSeatsBooked;

        let query = "INSERT INTO Booking (bookingStatus, numSeatsBooked, numPointsEarned,transactionDate, transactionAmount, username)" +
            "VALUES (" +
            "        'Booked'," +
            "      ''" + numSeatsBooked + "'', " +
            "   (2 * (SELECT seatPrice " +
            "      FROM FlightSchedule " +
            "     WHERE (flightNo = '" + flightNo + "')) * 0.1), " +
            "  CURDATE(), " +
            "  (2 * (SELECT seatPrice " +
            "     FROM FlightSchedule " +
            "      WHERE (flightNo = '" + flightNo + "'))), " +
            "    '" + req.session.user + "'); "
            db.query
            (query, (err, result) => {
                if (err) {
                    return res.status(500).send(err);
                }
                else {
                    //render page and pass in query results
                    res.render
                        (
                            

                        );
                }
            }
            )
        
    }
}