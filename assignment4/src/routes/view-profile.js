module.exports = {
  viewProfilePage: (req, res) =>
  {
    //get username
    let username = req.session.user;
    let query = "SELECT points FROM Client WHERE username='"+username+"'";
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
            res.render('view-profile.ejs', {points: result[0].points});
          }
        }
    )
  }
}