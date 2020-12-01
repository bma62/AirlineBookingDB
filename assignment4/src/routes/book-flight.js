//variables storing user inputs during flight booking
var departure;
var arrival;
var travlelDate;

module.exports = {
    bookDeparturePage: (req, res) =>
    {
        //generate query to get distinct airports that have departure flights
        let query =
            "SELECT DISTINCT a.* " +
            "FROM Flight f, FlightSchedule fs, Airport a " +
            "WHERE f.flightNo = fs.flightNo " +
                "AND fs.departureAirportIATA = a.airportIATA;";
        db.query
        (query, (err, result) =>
            {
                if (err)
                {
                    return res.status(500).send(err);
                }
                else
                {
                    //render page and pass in query results
                    res.render('book-departure.ejs', {departureAirports: result});
                }
            }
        )
    },

    bookDeparture: (req, res) =>
    {
        //get the airport IATA of the selected value in the datalist
        departure = req.body.departure.substr(0, req.body.departure.indexOf(','));
        res.redirect('/arrival');
    },

    bookArrivalPage: (req,res) =>
    {
        var arrivalAirports;
        //query airports that can be arrived from the selected departure airport
        var query =
            "SELECT DISTINCT a.* " +
            "FROM FlightSchedule fs, Airport a " +
            "WHERE fs.departureAirportIATA = '"+departure+"' " +
                "AND fs.arrivalAirportIATA = a.airportIATA;"
        db.query
        (query, (err, result) =>
            {
                if (err)
                {
                    return res.status(500).send(err);
                }
                else
                {
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
            "WHERE fs.departureAirportIATA = '"+departure+"'" +
                "AND fs.arrivalAirportIATA = a.airportIATA " +
                "AND fs.flightNo = f.flightNo " +
                "AND f.departureDate BETWEEN DATE_SUB(CURDATE(),INTERVAL 30 DAY) AND CURDATE() " +
            "GROUP BY fs.arrivalAirportIATA, a.city, a.country " +
            "ORDER BY SUM(numSeatsSold) DESC;";
        db.query
        (query, (err, result) =>
            {
                if (err)
                {
                    return res.status(500).send(err);
                }
                else
                {
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

    bookFlight: (req, res) =>
    {

    }
}