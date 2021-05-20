class Laser
  def initialize(args, x:, y:)
    @args = args
    @x = x
    @y = y
  end

  def propel
    args.outputs.sprites << [
      @x,
      @y,
      40,
      40,
      'sprites/ruby.png',
      180
    ]

    @y += 10
  end

  def hit?
    args.state.enemies.any? do |enemy|
      @y.between?(enemy.y - 20, enemy.y + 50) &&
        @x.between?(enemy.x - 20, enemy.x + 50)
    end
  end

  def handle_collision
    # if an_enemy? && laser_hit?
    #   render_explosion_position
      args.state.score_keeper.increment_score
    # end
  end

  private

  attr_accessor :args, :x, :y

  # def render_explosion_position
  #   args.state.enemies.each do |enemy|
  #     args.state.explosion.x = args.state.enemy.x
  #     args.state.explosion.y = args.state.enemy.y
  #     args.state.enemy.x = nil
  #     args.state.enemy.y = nil
  #   end
  # end

  # def render_explosion_sprite
  #   if args.state.explosion
  #     args.outputs.sprites << [
  #       args.state.explosion.x - 50,
  #       args.state.explosion.y - 50,
  #       150,
  #       150,
  #       'sprites/boom.png'
  #     ]
  #   end
  # end
end
