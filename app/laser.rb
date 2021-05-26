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
    temp_enemies = args.state.enemies
    args.state.enemies.each do |enemy|
      if @y.between?(enemy.y - 20, enemy.y + 50) &&
         @x.between?(enemy.x - 20, enemy.x + 50)
        temp_enemies.delete(enemy)
        render_explosion(enemy.x, enemy.y)
      end
    end
    args.state.enemies = temp_enemies

    args.state.score_keeper.increment_score
  end

  private

  attr_accessor :args, :x, :y

  def render_explosion(x, y)
    args.outputs.sprites << [
      x - 50,
      y - 50,
      150,
      150,
      'sprites/boom.png'
    ]
  end
end
