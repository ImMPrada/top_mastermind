class Player
  def initialize(name)
    @name = name
    @rol = nil
    @score = 0
  end

  def setup
    puts 'Please enter your PIN:'.yellow
    @pin = gets.chomp
    system 'clear'
  end

  def change_rol(rol)
    @rol = rol
  end
end
