class Player
  def initialize(args)
    @args = args
  end

  attr_accessor :args

  def move
    return current_position if out_of_bounds?

    new_position
  end

  private

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
