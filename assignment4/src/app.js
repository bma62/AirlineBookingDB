// set up the project
const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const path = require('path');

const app = express();

const port = 5000;
// const {getHomePage} = require('./routes/index');
// const {addPlayerPage, addPlayer, deletePlayer, editPlayer, editPlayerPage} = require('./routes/player');

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
  console.log('MySQL Connected...');
});

//make sure db can be used globally
global.db = db;

// Configure the middleware
app.set('port', process.env.port || port); //set port number express uses
app.set('views', __dirname + '/views'); //set views folder for rendering
app.set('view engine', 'ejs'); //use ejs as template editor
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json()); //parse from data client
app.use(express.static(path.join(__dirname, 'public')));

//connect routes and views
// app.get('/', getHomePage); //comment missing
// app.get('/add', addPlayerPage); //comment missing
// app.get('/edit/:id', editPlayerPage); //comment missing
// app.get('/delete/:id', deletePlayer); //comment missing
// app.post('/add', addPlayer); //comment missing
// app.post('/edit/:id', editPlayer); //comment missing


// set the app to listen on the port
app.listen(port, () => {
  console.log(`Server running on port: ${port}`);
});