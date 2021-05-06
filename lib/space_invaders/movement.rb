class Movement
  def initialize(args)
    @args = args
  end

  attr_accessor :args

  def keyboard
    return current_position if out_of_bounds?

    new_position
  end

  # def mouse
  #   return [args.state.x, args.state.y] if out_of_bounds?
  #
  #   [
  #     args.inputs.mouse.click.point.x - 64,
  #     args.inputs.mouse.click.point.y - 50
  #   ]
  # end

  private

  def current_position
    {
      x: args.state.x,
      y: args.state.y
    }
  end

  def new_position
    {
      x: args.state.x + (args.inputs.keyboard.left_right * 10),
      y: args.state.y + (args.inputs.keyboard.up_down * 10)
    }
  end

  def future_position
  end

  def out_of_bounds?
    x = new_position[:x]
    y = new_position[:y]

    x > args.grid.w ||
      x < 0 ||
    y > args.grid.h ||
      y < 0
  end
end
