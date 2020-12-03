module.exports = {
    viewBookingPage: (req, res) =>
    {
        //get username
        let username = req.session.user;
        let query = "SELECT * FROM Booking WHERE username='"+username+"'";
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
                    res.render('view-booking.ejs', {bookings: result});
                }
            }
        )
    },

    cancelBooking: (req, res) =>
    {
        let username = req.session.user;
        let confirmationNo = req.params.confirmationNo;
        // first, update the booking status to cancelled
        var query =
            "UPDATE Booking " +
            "SET bookingStatus = 'Cancelled' " +
            "WHERE confirmationNo = "+confirmationNo+";";
        db.query(query, (err, result) => {
            if (err) return res.status(500).send(err);
        })

        //get how many points were added for that booking
        query =
            "SELECT transactionAmount " +
            "FROM Booking " +
            "WHERE confirmationNo = "+confirmationNo+";";
        db.query(query, (err, result) => {
            if (err) return res.status(500).send(err);
            let points = Math.round(result[0].transactionAmount * 0.1);

            //subtract those points as booking is cancelled now
            query =
                "UPDATE Client " +
                "SET points = points - " + points + " "
                "WHERE username = '"+username+"';";
            db.query(query, (err, result) => {
                if (err) return res.status(500).send(err);
            });
        })

        // get more booking information from ticket
        query = "SELECT * FROM Ticket WHERE confirmationNo = "+confirmationNo+";";
        db.query(query, (err, result) => {
            if (err) return res.status(500).send(err);
            let seatNo = result[0].seatNo;
            let flightNo = result[0].flightNo;
            let travelDate = result[0].departureDate.toISOString().split('T')[0];

            //reset the booked seat to available
            query =
                "UPDATE Seat " +
                "SET seatStatus = 'Available' " +
                "WHERE seatNo = '"+seatNo+"' " +
                    "AND flightNo = '"+flightNo+"' " +
                    "AND departureDate = '"+travelDate+"';";
            db.query(query, (err, result) => {
                if (err) return res.status(500).send(err);
            });

            //decrement 1 to num seats sold for that flight
            query =
                "UPDATE Flight " +
                "SET numSeatsSold = numSeatsSold - 1 " +
                "WHERE flightNo = '"+flightNo+"' " +
                "AND departureDate = '"+travelDate+"';";
            db.query(query, (err, result) => {
                if (err) return res.status(500).send(err);
                //all operations done redirect to home page
                res.redirect('/');
            });
        })
    }
}