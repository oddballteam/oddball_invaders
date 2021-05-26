require 'app/laser.rb'

class Player
  attr_accessor :args, :lasers, :lives, :x, :y

  def initialize(args)
    @args = args
    @lasers = []
    @cooldown = 0
    @lives ||= 3

    @x ||= 576
    @y ||= 50
  end

  def handle_move
    @x = position[:x]
    @y = position[:y]

    args.outputs.sprites << [
      position[:x],
      position[:y],
      125,
      125,
      'sprites/player.png'
    ]
  end

  def handle_shoot
    if args.inputs.keyboard.space && @cooldown == 0 # if the space bar is pressed
      @lasers.push(Laser.new(args, x: @x + 40, y: @y + 110))
      @cooldown += 10
    end

    temp_lasers = []
    @lasers.each do |laser|
      laser.propel
      laser.hit? ? laser.handle_collision : temp_lasers.push(laser)
    end
    @lasers = temp_lasers

    @cooldown -= 1 if @cooldown > 0
  end

  def display_lives
    lives.times do |life|
      args.outputs.sprites << [
        life * 25 + 10,
        50.from_top,
        25,
        25,
        'sprites/oddheart.png'
      ]
    end
  end

  def remove_life
    @lives -= 1
  end

  private

  def position
    out_of_bounds? ? current_position : new_position
  end

  def current_position
    {
      x: @x,
      y: @y
    }
  end

  def new_position
    {
      x: @x + (args.inputs.keyboard.left_right * 10),
      y: @y + (args.inputs.keyboard.up_down * 10)
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
