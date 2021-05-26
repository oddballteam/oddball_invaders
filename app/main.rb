require 'app/player.rb'
require 'app/enemy.rb'
require 'app/score_keeper.rb'

def tick(args)
  initialize(args)

  args.state.score_keeper ||= ScoreKeeper.new(args)
  args.state.score_keeper.display_score

  args.state.player ||= Player.new(args)
  args.state.player.handle_move
  args.state.player.handle_shoot
  args.state.player.display_lives

  args.state.enemies ||= []
  args.state.enemies.push(Enemy.new(args)) if (args.state.tick_count % (rand(90) + 10)) == 0
  temp_enemies = []
  args.state.enemies.each do |enemy|
    enemy.handle_move
    enemy.out_of_bounds? ? args.state.player.remove_life : temp_enemies.push(enemy)
  end
  args.state.enemies = temp_enemies

  end_game(args) if game_over?(args)
end

private

def initialize(args)
  set_background_color(args, [10, 10, 20])
  args.state.colors.text ||= [255, 255, 255]
  # args.outputs.sounds << 'sounds/background.wav' if play_background_music?(args)
end

def set_background_color(args, color)
  args.state.colors.background ||= color
  args.state.night ||= [args.grid.rect, args.state.colors.background]
  args.outputs.solids << args.state.night
end

def play_background_music?(args)
  return true if args.state.tick_count == 0

  (args.state.tick_count / 2669) == 1
end

def end_game(args)
  args.state.enemies = []
  args.outputs.labels << [
    args.grid.w/2,
    args.grid.h/2,
    "Game Over",
    125,
    1,
    255,
    255,
    255
  ]
end

def game_over?(args)
  args.state.player.lives == 0
end
