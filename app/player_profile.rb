# frozen_string_literal: true

class PlayerOne < Player

  protected

  def speed
    10
  end

  def laser_cooldown
    15
  end

  def sprite
    'player'
  end

  def _thrusters
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
    end
  end
end

class PlayerTwo < Player

  protected

  def speed
    3
  end

  def laser_cooldown
    5
  end

  def sprite
    'player2'
  end

  def _thrusters
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


