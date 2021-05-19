class Player
  attr_accessor :args, :laser

  def initialize(args, laser:)
    @args = args
    @laser = laser

    args.state.player.x ||= 576
    args.state.player.y ||= 50
  end

  def move
    args.state.player.x = position[:x]
    args.state.player.y = position[:y]

    args.outputs.sprites << [
      position[:x],
      position[:y],
      125,
      125,
      'sprites/player.png'
    ]
  end

  def fire
    laser.shoot
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

    x > (args.grid.w - 100) ||
      x < -25 ||
    y > (args.grid.h - 125) ||
      y < 0
  end
end
