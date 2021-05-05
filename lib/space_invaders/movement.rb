class Movement
  def initialize(args)
    @args = args
  end

  attr_accessor :args

  def keyboard
    return [0, 0] if out_of_bounds?

    [
     args.inputs.keyboard.left_right * 10,
     args.inputs.keyboard.up_down * 10
    ]
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

  def future_position
  end

  def out_of_bounds?
    x = current_position[:x]
    y = current_position[:y]

    x > args.grid.w ||
      x < 0 ||
    y > args.grid.h ||
      y < 0
  end
end
