require 'app/player.rb'
require 'app/enemy.rb'
require 'app/score_keeper.rb'
require 'app/laser.rb'

def tick(args)
  score_keeper = ScoreKeeper.new(args)
  score_keeper.update

  player = Player.new(args, laser: Laser.new(args))
  player.move
  player.fire

  create_enemies(args)
end

def create_enemies(args)
  enemy_0 = Enemy.new(args, index: 0)
  enemy_0.move

  enemy_1 = Enemy.new(args, index: 1)
  enemy_1.move
end
