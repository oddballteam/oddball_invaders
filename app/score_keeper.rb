class ScoreKeeper
  attr_accessor :args, :score

  def initialize(args)
    @args = args
    @score ||= 0
  end

  def display_score
    args.outputs.labels << [1175, 700, "Score: #{score}"]
  end

  def increment_score
    @score += 1
  end
end
