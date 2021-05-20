class Enemy
  attr_accessor :args, :x, :y

  def initialize(args)
    @args = args
    @x = rand(args.grid.w - 150)
    @y = args.grid.h + 100
  end

  def handle_move
    @x = position[:x]
    @y = position[:y]

    args.outputs.sprites << [
      position[:x],
      position[:y],
      70,
      70,
      'sprites/js.png'
    ]
  end

  def out_of_bounds?
    position[:y] < -125
  end

  private

  def position
    {
      x: @x,
      y: @y - 2
    }
  end
end
