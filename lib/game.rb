module Mastermind
  class Game
    def initialize
      @player1 = nil
      @player2 = nil
      @encrypter = nil
      @hacker = nil
    end

    def setup_game
      print_head
      setup_player1
      print_head
      setup_player2

      change_rols
    end

    def change_rols
      change_encrypter
      change_hacker

      print_title
      print_rols
    end

    private

    def setup_player1
      puts H3_FONT.write('PLAYER 1:').yellow
      puts "\n"
      puts 'Please enter your name:'.yellow
      @player1 = Player.new(gets.chomp)
      @player1.setup
    end

    def setup_player2
      puts H3_FONT.write('PLAYER 2:').yellow
      puts "\n"
      puts 'Please enter your name:'.yellow
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

    def print_title
      puts H1_FONT.write(TITLE).cyan
    end

    def print_head
      print_title
      puts '--------------------------------------------'.yellow
      puts 'Welcome to Mastermind!'.yellow
      puts 'Remember:'.yellow
      puts "- Player1 wi'll be initial encrypter".yellow
      puts "- you'll need PIN to reveal encrypted code".yellow
      puts "\n"
    end

    def print_rols
      puts '--------------------------------------------'.yellow
      puts 'ROLES:'.yellow
      puts "#{@player1.name}: #{@player1.rol}".yellow
      puts "#{@player2.name}: #{@player2.rol}".yellow
      puts '--------------------------------------------'.yellow
    end
  end
end
