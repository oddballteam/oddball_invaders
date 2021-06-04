class Star
  attr_reader :x_position, :y_position, :text, :size, :alignment, :red, :green, :blue, :alpha

  VISIBLE_BODY = '*'
  SIZE         = 1
  ALIGNMENT    = 2

  def initialize(x_position:, y_position:)
    @x_position = x_position
    @y_position = y_position
    @text       = VISIBLE_BODY
    @size       = SIZE
    @alignment  = ALIGNMENT
    @red        = random_value_in_range
    @green      = random_value_in_range
    @blue       = random_value_in_range
    @alpha      = random_value_in_range
    @twinkler   = [true, false].sample
  end

  def update(top_of_starfield:)
    decrement_y_position(top_of_starfield: top_of_starfield)
    twinkle
  end

  private

  def decrement_y_position(top_of_starfield:)
    @y_position = random_value_in_range(start: (top_of_starfield - 20), stop: top_of_starfield) if @y_position <= 10
    @y_position = (@y_position - 1)
  end

  def twinkle
    @alpha = random_value_in_range if @twinkler
  end

  def random_value_in_range(start: 0, stop: 255)
    (start..stop).to_a.sample
  end
end
