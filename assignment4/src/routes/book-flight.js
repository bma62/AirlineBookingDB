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
        //get the selected value in the datalist
        departure = req.querySelector('#departureList').value;
        res.redirect('/arrival');
    },

    bookArrivalPage: (req,res) =>
    {
        
    }

    bookFlight: (req, res) =>
    {

    }
}