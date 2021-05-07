require 'app/player.rb'
require 'app/player.rb'

def tick(args)
  args.state.player.x ||= 576
  args.state.player.y ||= 100

  player = Player.new(args)

  args.state.player.x = player.move[:x]
  args.state.player.y = player.move[:y]

  if args.inputs.keyboard.space # if the space bar is pressed
    args.state.lazer.x = args.state.player.x + 40
    args.state.lazer.y = args.state.player.y + 110
    args.state.lazer.angle = 0
  end

  if args.state.lazer
    args.outputs.sprites << [
      args.state.lazer.x,
      args.state.lazer.y,
      40,
      40,
      'sprites/firepower.png',
      args.state.lazer.angle
    ]

    args.state.lazer.angle += 10
    args.state.lazer.y += 10
  end

  args.outputs.sprites << [
    args.state.player.x,
    args.state.player.y,
    125,
    125,
    'sprites/player.png',
  ]
end
