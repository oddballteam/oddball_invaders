require 'app/player.rb'
require 'app/enemy.rb'
require 'app/score_keeper.rb'

def tick(args)
  args.state.colors.background ||= [10, 10, 20]
  args.state.colors.text ||= [255, 255, 255]
  args.state.colors.star ||= [128, 200, 255]
  args.state.night ||= [args.grid.rect, args.state.colors.background]  
  args.outputs.solids << args.state.night
  args.outputs.sounds << 'sounds/background.wav' if args.state.tick_count == 0

  args.state.score_keeper ||= ScoreKeeper.new(args)
  args.state.score_keeper.display_score

  args.state.player ||= Player.new(args)
  args.state.player.handle_move
  args.state.player.handle_shoot

  args.state.enemies ||= []
  args.state.enemies.push(Enemy.new(args)) if (args.state.tick_count % (rand(10) + 10)) == 0
  temp_enemies = []
  args.state.enemies.each do |enemy|
    enemy.handle_move
    temp_enemies.push(enemy) unless enemy.out_of_bounds?
  end
  args.state.enemies = temp_enemies
end
