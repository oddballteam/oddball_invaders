class ScoreKeeper
  attr_accessor :args
  
  def initialize(args)
    @args = args

    args.state.score ||= 0
  end

  def update
    args.outputs.labels << [1175, 700, "Score: #{args.state.score}"]
  end
end
