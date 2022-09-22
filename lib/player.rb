class Player
  attr_reader :name, :rol, :score

  def initialize(name)
    @name = name
    @rol = nil
    @score = 0
    @render = Render.new
  end

  def setup
    @render.print_pin_question
    @pin = gets.chomp
  end

  def change_rol(rol)
    @rol = rol
  end

  def add_score(score)
    @score += score
  end
end
