class Player
  attr_accessor :args

  def initialize(args)
    @args = args

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

  def shoot
    if args.inputs.keyboard.space # if the space bar is pressed
      args.state.laser.x = args.state.player.x + 40
      args.state.laser.y = args.state.player.y + 110
      args.state.laser.angle = 0
    end

    if args.state.laser
      if args.state.enemy
        if args.state.laser.y.between?(args.state.enemy.y - 20, args.state.enemy.y + 50) &&
           args.state.laser.x.between?(args.state.enemy.x - 20, args.state.enemy.x + 50)
          args.state.explosion.x = args.state.enemy.x
          args.state.explosion.y = args.state.enemy.y
          args.state.enemy.x = nil
          args.state.enemy.y = nil
          args.state.score += 1
        end
      end

      if args.state.explosion
        args.outputs.sprites << [
            args.state.explosion.x - 50,
            args.state.explosion.y - 50,
            150,
            150,
            'sprites/boom.png'
          ]
      end

      args.outputs.sprites << [
        args.state.laser.x,
        args.state.laser.y,
        40,
        40,
        'sprites/ruby.png',
        180
      ]

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

    x > (args.grid.w - 100) ||
      x < -25 ||
    y > (args.grid.h - 125) ||
      y < 0
  end
end
