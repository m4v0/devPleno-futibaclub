const express = require('express');
const bcrypt = require('bcryptjs');
const app = express.Router();

const init = connection => {
  // Rota Raiz do Projeto.
  // Metodo GET
  app.get('/', async(req, res) => {
    // const [rows, fields] = await connection.execute('select * from users');
    // console.log(rows);
    res.render('home');
  });

  // Routa para criar uma nova conta de usuário.
  // Metodo GET
  app.get('/new-account', (req,res) => {
    const { name, email, passwd } = '';
    res.render('new-account', { error: false });
  });
  // Metodo POST
  app.post('/new-account', async(req,res) => {
    const [rows, fields] = await connection.execute('select * from users where email = ?', [req.body.email]);
    if(rows.length === 0) {
      const { name, email, passwd } = req.body;
      // 
      // Cria um hash como password do usuário
      // modificado por: m4v0
      // em 29/01/2018 - 17:28
      //
      // funcionalidade criptografar a 
      // string passada pelo usuário da seha
      //
      const hashpwd = await bcrypt.hash(passwd, 10);
      //
      const [ inserted, insertFields ] = await connection.execute('insert into users (name, email, password, role) values (?,?,?,?)',[
        name,
        email,
        hashpwd, // Substitui varial criando pelo mentor 'passwd' para hashpwd.
        'user'
      ]);
      const user = {
        id: inserted.insertId,
        name: name,
        role: 'user'
      };
      req.session.user = user;
      res.redirect('/');
    }else{
      res.render('new-account', {
        error: 'Usuário já existente...'
      });
    };
  });

  // Rota para login
  // Metodo GET
  app.get('/login', (req, res) => {
    res.render('login', { error: false });
  });

  // Metodo POST
  app.post('/login', async(req, res) => {
    const { name, email, passwd } = req.body;
    const [rows, fields] = await connection.execute('select * from users where email = ?', [email]);
    if(rows.length === 0) {
      res.render('login', { error: 'Usuário não inválido...' })
    }else{
      // if(rows[0].password === passwd) { 
      //
      // modificado por: m4v0
      // em 29/01/2018 - 17:28
      //
      // bcrypt.compare função para comparar o conteudo
      // passado pelo usuário "senha", com a senha gravada
      // no cadastro do usuário, se forem iguais a função
      // retorna verdadeiro, caso contrario falso.
      //
      if(await bcrypt.compare(passwd, rows[0].password)) {
        const userDb = rows[0];
        const user = {
          id: userDb.id,
          name: userDb.name,
          role: userDb.role
        };
        req.session.user = user;
        res.redirect('/');
      }else{
        res.render('login', { error: 'Senha do usuário inválida...' })
      }
    }

  });

  // Rota de LOGOUT
  // Metodo GET
  app.get('/logout', (req, res) => {
    req.session.destroy( err => {
      res.redirect('/');
    });
  });

  return app
};

module.exports = init;