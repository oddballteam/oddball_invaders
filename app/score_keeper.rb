class ScoreKeeper
  attr_accessor :args, :score

  def initialize(args)
    @args = args
    @score ||= 0
  end

  def display_score
    args.outputs.labels << [1175, 700, "Score: #{score}", args.state.colors.text]
  end

  def increment_score
    @score += 1
  end

  def decrement_score
    @score -= 1
  end
end
