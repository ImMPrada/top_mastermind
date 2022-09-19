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

    change_rols
  end

  def change_rols
    change_encrypter
    change_hacker
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

  def change_encrypter
    if @encrypter == @player1
      @encrypter = @player2
      @player2.change_rol(:encrypter)
    else
      @encrypter = @player1
      @player1.change_rol(:encrypter)
    end
  end

  def change_hacker
    if @hacker == @player2
      @hacker = @player1
      @player1.change_rol(:hacker)
    else
      @hacker = @player2
      @player2.change_rol(:hacker)
    end
  end
end
