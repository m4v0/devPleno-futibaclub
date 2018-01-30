const express    = require('express');
const mysql      = require('mysql2/promise');
const bodyParser = require('body-parser');
const session    = require('express-session');
const account    = require('./account');
const admin      = require('./admin');
const groups     = require('./groups');
const app        = express();

app.use(express.static('public'));
app.use(bodyParser.urlencoded({ extended: true }))
app.use(session({
  secret: 'fullstack-academy',
  resave: true,
  saveUninitialized: true
}));
app.set('view engine', 'ejs');

const init = async() => {
  const connection = await mysql.createConnection({
    host: '127.0.0.1',
    user: 'futiba',
    password: 'futibaclub',
    database: 'futibaclub'
  });

  app.use((req, res, next) => {
    if(req.session.user){
      res.locals.user = req.session.user;
    }else{
      res.locals.user = false;
    };
    next();
  });

  app.use(account(connection));
  app.use('/admin', admin(connection));
  app.use('/groups', groups(connection));

  // Rota para criar 30000 usuário
  app.get('/create-user', async(req, res) => {
    const min = 1;
    const max = 30000;
    //const rand = min + Math.random() * (max - min);
    for(let i = min; i < max; i++){
      console.log(parseInt(min + Math.random() * (max - min)));
    };
    res.redirect('/');
  });

  app.listen(3000, err => {
    console.log('Futiba Club Server in running...')
  });  
};

init();

