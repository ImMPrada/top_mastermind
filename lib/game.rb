class Game
  H1_FONT = TTY::Font.new(:starwars)
  H3_FONT = TTY::Font.new(:straight)

  def initialize
    @player1 = nil
    @player2 = nil
    @encrypter = nil
    @hacker = nil
  end

  def setup_game
    puts H1_FONT.write('MASTERMIND').cyan
    setup_player1
    puts H1_FONT.write('MASTERMIND').cyan
    setup_player2
    puts H1_FONT.write('MASTERMIND').cyan
  end

  private

  def setup_player1
    puts H3_FONT.write('PLAYER 1:').yellow
    puts 'Please enter your name:'.yellow
    @player1 = Player.new(gets.chomp)
    @player1.setup
  end

  def setup_player2
    puts H3_FONT.write('PLAYER 2:').yellow
    puts 'Please enter your opponent\'s name:'.yellow
    @player2 = Player.new(gets.chomp)
    @player2.setup
  end
end
