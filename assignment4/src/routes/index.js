module.exports = {
  getHomePage: (req, res) => {
    res.render('index.ejs', {name: req.session.user})
  },

  loginPage: (req, res) => {
    res.render('login.ejs')
  },

  registerPage: (req, res) => {
    res.render('register.ejs')
  },

  register: (req, res) => {
    //make SQL query with username and password
    let query = "INSERT INTO Client (username,password) VALUES ('" +
        req.body.username + "', '" + req.body.password + "')";
    //send query to database
    db.query
    (query, (err, result) =>
        {
          if (err) return res.status(500).send(err);
          //if registration successful, redirect to login page
          res.redirect('/login')
        }
    )
  },

  login: (req, res) =>
  {
    //get parameters
    let username = req.body.username;
    let password = req.body.password;

    //make SQL query
    let query = "SELECT * FROM Client WHERE username = '"+ username +"' " ;
    db.query(query, (err, result) =>
    {
      if (err) return res.status(500).send(err);

      //if result is not null = username exists
      if (result.length > 0)
      {
        //if password matches, success
        if (password === result[0].password)
        {
          req.session.user = username;
          res.redirect('/');
        }
        else
          return res.status(500).send('Incorrect password');
      }
      //username not in db
      else
      {
        return res.status(500).send('Username does not exist');
      }
    })
  },

  logout: (req, res) =>
  {
    //destroy session and redirect to login
    req.session.destroy();
    res.redirect('/login');
  }
}