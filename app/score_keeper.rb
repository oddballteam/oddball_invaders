class ScoreKeeper
  attr_accessor :args, :score

  def initialize(args)
    @args = args
    @score = 0
  end

  def update
    args.outputs.labels << [1175, 700, "Score: #{score}"]
  end

  def update_score
    score += 1
  end
end
