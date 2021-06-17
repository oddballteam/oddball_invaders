require 'app/star.rb'

class StarField
  attr_accessor :stars

  STAR_COLUMNS = 50

  def initialize(args)
    @args = args
    @stars ||= stars
  end

  def draw
    @stars.each do |star|
      @args.outputs.labels << [
        star.x_position,
        star.y_position,
        star.text,
        star.size,
        star.alignment,
        star.red,
        star.green,
        star.blue,
        star.alpha
      ]
      star.update(top_of_starfield: @args.grid.top)
    end
  end

  private

  def stars
    column_width = (@args.grid.w / STAR_COLUMNS)
    STAR_COLUMNS.times.map do |index|
      star_x_position = index * column_width
      Star.new(x_position: star_x_position, y_position: random_y_position)
    end
  end

  def random_y_position
    (@args.grid.bottom..@args.grid.top).to_a.sample
  end
end
