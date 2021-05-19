class Laser
  def initialize(args)
    @args = args
  end

  def shoot
    if args.inputs.keyboard.space # if the space bar is pressed
      args.state.laser.x = args.state.player.x + 40
      args.state.laser.y = args.state.player.y + 110
    end

    return unless args.state.laser

    handle_collision
    render_explosion_sprite
    propel_laser
  end

  private

  attr_accessor :args

  def render_explosion_position
    args.state.enemies.each do |enemy|
      args.state.explosion.x = args.state.enemy.x
      args.state.explosion.y = args.state.enemy.y
      args.state.enemy.x = nil
      args.state.enemy.y = nil
    end
  end

  def render_explosion_sprite
    if args.state.explosion
      args.outputs.sprites << [
        args.state.explosion.x - 50,
        args.state.explosion.y - 50,
        150,
        150,
        'sprites/boom.png'
      ]
    end
  end

  def handle_collision
    if an_enemy? && laser_hit?
      render_explosion_position
      args.state.score += 1
    end
  end

  def an_enemy?
    args.state.enemies.any?
  end

  def laser_hit?
    args.state.enemies.any? do |enemy|
      args.state.laser.y.between?(enemy.y - 20, enemy.y + 50) &&
        args.state.laser.x.between?(enemy.x - 20, enemy.x + 50)
    end
  end

  def propel_laser
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
