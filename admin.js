const express = require('express');
const app = express.Router();

const init = connection => {

  app.use((req, res, next) => {
    if(!req.session.user || req.session.user.role === 'user') {
      res.redirect('/');
    } else {
      next();
    };
  });

  // Rota Raiz do Projeto.
  // Metodo GET
  app.get('/', async(req, res) => {
    // const [rows, fields] = await connection.execute('select * from users');
    // console.log(rows);
    // res.render('home');
    res.send('Olá admin')
  });
  
  app.get('/games', async(req, res) => {
    const [rows, fields] = await connection.execute('select * from games');
    res.render('admin/games', {
      games: rows
    });
  });

  app.post('/games', async(req, res) => {
    const { team_a, team_b } = req.body;
    await connection.execute('insert into games(team_a, team_b) value (?,?)',[
      team_a,
      team_b
    ]);
    res.redirect('/admin/games');
  });

  app.post('/games/results', async(req, res) => {
		const games = [];
		Object
			.keys(req.body)
			.forEach(team => {
				// const parts = team.split('_');
				// const game  = ;
				games.push({
					game_id: parseInt(team.split('_')[1]),
					result_a: parseInt(req.body[team].a),
					result_b: parseInt(req.body[team].b)
				});
			});
    
    for(let i=0; i < games.length; i++){
      const game = games[i];
      const [ guessings ] = await connection.execute('select * from guessings where game_id = ?', [
        game.game_id
      ]);
      const batch = guessings.map(guess => {
        let score = 0;

        if(guess.result_a === game.result_a && guess.result_b === game.result_b) {
          score = 100;
        } else {
          if(guess.result_a === game.result_a || guess.result_b === game.result_b) {
            score += 25;
            if(guess.result_a < guess.result_b && game.result_a < game.result_b) {
              score += 25;
            }
            if(guess.result_a > guess.result_b && game.result_a > game.result_b) {
              score += 25;
            }
          }
        }
        return connection.execute('update guessings set score = ? where id = ?', [
          score,
          guess.id
        ]);
      });
      await Promise.all(batch);
    };
    res.redirect('/admin/games');
  });

  app.get('/games/delete/:id', async(req, res) => {
    await connection.execute('delete from games where id = ? limit 1', [
      req.params.id
    ]);
    res.redirect('/admin/games');
  });

  return app
};

module.exports = init;