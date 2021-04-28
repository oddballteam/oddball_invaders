def tick(args)
  args.state.x ||= 576
  args.state.y ||= 100

  movement = Movement.new(args)

  args.state.x += movement.keyboard[0]
  args.state.y += movement.keyboard[1]

  if args.inputs.mouse.click
    args.state.x, args.state.y = movement.mouse
  end


  args.outputs.sprites << [
    args.state.x,
    args.state.y,
    128,
    101,
    'sprites/Ships.png',
  ]
end

class Movement
  def initialize(args)
    @args = args
  end

  attr_accessor :args

  def keyboard
    [
      args.inputs.keyboard.left_right * 10,
      args.inputs.keyboard.up_down * 10
    ]
  end

  def mouse
    [
      args.inputs.mouse.click.point.x - 64,
      args.inputs.mouse.click.point.y - 50
    ]
  end
end
