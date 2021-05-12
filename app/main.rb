require 'app/player.rb'
require 'app/enemy.rb'

def tick(args)
  player = Player.new(args)
  player.move
  player.shoot

  enemy = Enemy.new(args)
  enemy.move
end
