class Game
  @@h1_font = TTY::Font.new(:starwars)
  @@h3_font = TTY::Font.new(:straight)

  def initialize
    @player1 = nil
    @player2 = nil
    @encrypter = nil
    @hacker = nil
  end

  def setup_game
    puts @@h1_font.write('MASTERMIND').cyan
    setup_player1
    setup_player2
  end

  private

  def setup_player1
    puts @@h3_font.write('PLAYER 1:').yellow
    puts 'Please enter your name:'.yellow
    @player1 = Player.new(gets.chomp)
    @player1.setup
  end

  def setup_player2
    puts @@h3_font.write('PLAYER 2:').yellow
    puts 'Please enter your opponent\'s name:'.yellow
    @player2 = Player.new(gets.chomp)
    @player2.setup
  end
end
