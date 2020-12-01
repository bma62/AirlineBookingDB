// set up the project
const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const path = require('path');
const session = require('express-session');
const cookieParser = require('cookie-parser');

const app = express();

const port = 5000;
const {getHomePage, loginPage,
  registerPage, login, register, logout} = require('./routes/index');
const {viewProfilePage} = require('./routes/view-profile');
const {viewBookingPage} = require('./routes/view-booking');
const {bookDeparturePage, bookDeparture,
  bookArrivalPage, bookArrival, bookDatePage} = require('./routes/book-flight');

// Create connection
const db = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'root',
  database : 'airline-ticket-database'
});

// Connect to database
db.connect((err) => {
  if(err){
    throw err;
  }
  console.log('MySQL connected!');
});

//make sure db can be used globally
global.db = db;

// Configure the middleware
app.set('port', process.env.port || port); //set port number express uses
app.set('views', __dirname + '/views'); //set views folder for rendering
app.set('view engine', 'ejs'); //use ejs as template editor
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json()); //parse from data client
app.use(express.static(path.join(__dirname, 'public'))); //configure to use public folder

// initialize cookie-parser to allow us access the cookies stored in the browser.
app.use(cookieParser());
// initialize express-session to allow us track the logged-in user across sessions.
app.use(session({
  key: 'user_sid',
  secret: 'secret',
  resave: false,
  saveUninitialized: false,
  cookie: {
    expires: 600000
  }
}));
// middleware function to check for logged-in users
function checkSignIn(req, res, next){
  if(req.session.user){
    next();     //If session exists, proceed to page
  } else {
    res.redirect('/login') //else, redirect to login
  }
}

//connect routes and views
app.get('/', checkSignIn, getHomePage); //if user signed in, get home page
app.get('/login', loginPage);
app.get('/logout', logout);
app.get('/register', registerPage);
app.get('/profile', checkSignIn, viewProfilePage);
app.get('/booking', checkSignIn, viewBookingPage);
app.get('/departure', checkSignIn, bookDeparturePage);
app.get('/arrival', checkSignIn, bookArrivalPage);
app.get('/date', checkSignIn, bookDatePage);

app.post('/register', register);
app.post('/login', login);
app.post('/departure', bookDeparture)
app.post('/arrival', bookArrival)

// app.get('/add', addPlayerPage); //comment missing
// app.get('/edit/:id', editPlayerPage); //comment missing
// app.get('/delete/:id', deletePlayer); //comment missing
// app.post('/add', addPlayer); //comment missing
// app.post('/edit/:id', editPlayer); //comment missing



// set the app to listen on the port
app.listen(port, () => {
  console.log(`Server running on port: ${port}`);
});