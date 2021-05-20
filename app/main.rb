require 'app/player.rb'
require 'app/enemy.rb'
require 'app/score_keeper.rb'

def tick(args)
  args.state.score_keeper ||= ScoreKeeper.new(args)
  args.state.score_keeper.display_score

  args.state.player ||= Player.new(args)
  args.state.player.handle_move
  args.state.player.handle_shoot

  args.state.enemies ||= []
  args.state.enemies.push(Enemy.new(args)) if (args.state.tick_count % (rand(40) + 150)) == 0
  temp_enemies = []
  args.state.enemies.each do |enemy|
    enemy.handle_move
    temp_enemies.push(enemy) unless enemy.out_of_bounds?
  end
  args.state.enemies = temp_enemies
end
