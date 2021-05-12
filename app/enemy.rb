class Enemy
  def initialize(args)
    @args = args

    args.state.enemy.x = (args.state.enemy.x.nil? || out_of_bounds?) ? rand(args.grid.w) : args.state.enemy.x
    args.state.enemy.y = (args.state.enemy.y.nil? || out_of_bounds?) ? args.grid.h + 100 : args.state.enemy.y
  end

  attr_accessor :args

  def move
    args.state.enemy.x = position[:x]
    args.state.enemy.y = position[:y]

    args.outputs.sprites << [
      position[:x],
      position[:y],
      50,
      50,
      'sprites/js.png',
    ]
  end

  private

  def position
    {
      x: args.state.enemy.x,
      y: args.state.enemy.y - 2
    }
  end

  def out_of_bounds?
    x = position[:x]
    y = position[:y]

    y < -125
  end
end
