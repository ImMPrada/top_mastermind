class Player
  def initialize(name)
    @name = name
  end

  def setup
    puts 'Please enter your PIN:'.yellow
    @pin = gets.chomp
  end
end
