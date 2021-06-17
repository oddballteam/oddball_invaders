require 'app/laser.rb'

class Player
  attr_accessor :args, :lasers, :lives, :x, :y, :sprite

  def initialize(args)
    @args = args
    @lasers = []
    @cooldown = 0
    @lives ||= 3
    @sprite ||= ['player', 'player2'].sample

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
      "sprites/#{sprite}.png"
    ]

    thrusters
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

  def moving_left?
    new_position[:x] < current_position[:x]
  end

  def moving_right?
    new_position[:x] > current_position[:x]
  end

  def out_of_bounds?
    x = new_position[:x]
    y = new_position[:y]

    x > (args.grid.w - 100) ||
      x < -25 ||
    y > (args.grid.h - 125) ||
      y < 0
  end

  def thrusters
    return unless current_position != new_position

    20.times do |time|
      height = moving_right? ? 45 : 30
      opacity = rand(40) + 185
      args.outputs.solids << {
        x: position[:x] + 30,
        y: position[:y] - (height * time),
        w: 5,
        h: height,
        r: 150,
        g: 226,
        b: 229,
        a: opacity - (10 * time)
      }

      height = moving_left? ? 45 : 30
      args.outputs.solids << {
        x: position[:x] + 90,
        y: position[:y] - (height * time),
        w: 5,
        h: height,
        r: 150,
        g: 226,
        b: 229,
        a: opacity - (10 * time)
      }

      if sprite == 'player2'
        opacity = rand(20) + 108
        args.outputs.solids << {
          x: position[:x] + 35,
          y: position[:y] - (30 * time),
          w: 60,
          h: 30,
          r: 0,
          g: 206,
          b: 209,
          a: opacity - (10 * time)
        }
      end
    end
  end
end
