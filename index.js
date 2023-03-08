const express = require('express');
const path = require('path');

let app = express();
const port = process.env.PORT || 3044
app.engine('.ejs', require('ejs').__express);

// Optional since express defaults to CWD/views

app.set('views', path.join(__dirname, 'views'));

// Path to our public directory

app.use(express.static(path.join(__dirname, 'public')));

// Without this you would need to
// supply the extension to res.render()
// ex: res.render('users.html').
app.set('view engine', 'ejs');

app.get('/', function(req, res){
  res.render('maintenance');
});

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
  })