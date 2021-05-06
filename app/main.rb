# require 'lib/space_invaders.rb'
require 'lib/space_invaders/movement.rb'

def tick(args)
  args.state.x ||= 576
  args.state.y ||= 100

  movement = Movement.new(args)

  args.state.x = movement.keyboard[:x]
  args.state.y = movement.keyboard[:y]

  # if args.inputs.mouse.click
  #   args.state.x, args.state.y = movement.mouse
  # end

  args.outputs.sprites << [
    args.state.x,
    args.state.y,
    128,
    101,
    'sprites/Ships.png',
  ]
end
