class ScoreKeeper
  attr_accessor :args, :score

  def initialize(args)
    @args = args
    @score ||= 0
  end

  def display_score
    args.outputs.labels << {
      x: 20.from_right,
      y: 675,
      text: "Previous Score: #{args.state.previous_score}",
      alignment_enum: 2,
      r: 169,
      g: 169,
      b: 169,
      a: 255,
    } if args.state.previous_score

    args.outputs.labels << {
      x:              20.from_right,
      y:              700,
      text:           "Score: #{score}",
      alignment_enum: 2,
      r:              95,
      g:              158,
      b:              160,
      a:              255,
    }
  end

  def increment_score
    @score += 1
  end

  def decrement_score
    @score -= 1
  end

  def reset_score
    @score = 0
  end
end
