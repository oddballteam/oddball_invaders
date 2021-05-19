class Enemy
  attr_accessor :args, :index

  def initialize(args, index:)
    @args = args
    @index = index

    args.state.enemies[index].x = (args.state.enemies[index].x.nil? || out_of_bounds?) ? rand(args.grid.w - 150) : args.state.enemies[index].x
    args.state.enemies[index].y = (args.state.enemies[index].y.nil? || out_of_bounds?) ? args.grid.h + 100 : args.state.enemies[index].y
  end

  def move
    args.state.enemies[index].x = position[:x]
    args.state.enemies[index].y = position[:y]

    args.outputs.sprites << [
      position[:x],
      position[:y],
      70,
      70,
      'sprites/js.png'
    ]
  end

  private

  def position
    {
      x: args.state.enemies[index].x,
      y: args.state.enemies[index].y - 2
    }
  end

  def out_of_bounds?
    position[:y] < -125
  end
end
