class Player
  attr_reader :name, :role, :score

  def initialize(name)
    @name = name
    @role = nil
    @score = 0
    @render = Render.new
  end

  def setup
    @render.print_pin_question
    @pin = gets.chomp
  end

  def change_role(role)
    @role = role
  end

  def add_score(score)
    @score += score
  end
end
