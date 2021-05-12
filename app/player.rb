class Player
  def initialize(args)
    @args = args

    args.state.player.x ||= 576
    args.state.player.y ||= 100
  end

  attr_accessor :args

  def move
    args.state.player.x = position[:x]
    args.state.player.y = position[:y]

    args.outputs.sprites << [
      position[:x],
      position[:y],
      125,
      125,
      'sprites/player.png',
    ]
  end

  def shoot
    if args.inputs.keyboard.space # if the space bar is pressed
      args.state.laser.x = args.state.player.x + 40
      args.state.laser.y = args.state.player.y + 110
      args.state.laser.angle = 0
    end

    if args.state.laser
      args.outputs.sprites << [
        args.state.laser.x,
        args.state.laser.y,
        40,
        40,
        'sprites/firepower.png',
        args.state.laser.angle
      ]

      args.state.laser.angle += 10
      args.state.laser.y += 10
    end
  end

  private

  def position
    out_of_bounds? ? current_position : new_position
  end

  def current_position
    {
      x: args.state.player.x,
      y: args.state.player.y
    }
  end

  def new_position
    {
      x: args.state.player.x + (args.inputs.keyboard.left_right * 10),
      y: args.state.player.y + (args.inputs.keyboard.up_down * 10)
    }
  end

  def out_of_bounds?
    x = new_position[:x]
    y = new_position[:y]

    x > (args.grid.w - 125) ||
      x < 0 ||
    y > (args.grid.h - 125) ||
      y < 0
  end
end
