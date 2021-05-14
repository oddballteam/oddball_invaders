require 'app/player.rb'
require 'app/enemy.rb'
require 'app/score_keeper.rb'

def tick(args)
  score_keeper = ScoreKeeper.new(args)
  score_keeper.update

  player = Player.new(args)
  player.move
  player.shoot

  enemy = Enemy.new(args)
  enemy.move
end
