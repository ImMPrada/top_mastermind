class Render
  H1_FONT = TTY::Font.new(:starwars)
  H3_FONT = TTY::Font.new(:straight)
  TITLE = 'MASTERMIND'.freeze

  def print_title
    system 'clear'
    puts H1_FONT.write(TITLE).cyan
  end

  def print_start_head
    print_title
    puts '--------------------------------------------'.yellow
    puts 'Welcome to Mastermind!'.yellow
    puts 'Remember:'.yellow
    puts "- Player1 wi'll be initial encrypter".yellow
    puts "- you'll need PIN to reveal encrypted code".yellow
    puts "\n"
  end

  def print_name_question(player_caption)
    puts H3_FONT.write("#{player_caption}:").yellow
    puts "\n"
    puts 'Please enter your name:'.yellow
  end

  def print_pin_question
    puts "\n"
    puts 'Please enter your PIN:'.yellow
  end

  def print_roles(player1, player2)
    puts '--------------------------------------------'.yellow
    puts 'ROLES:'.yellow
    puts "#{player1.name} -- #{player1.rol}".light_green
    puts "#{player2.name} -- #{player2.rol}".light_green
    puts '--------------------------------------------'.yellow
    puts "\n"
  end

  def ask_for_code(name)
    puts "\n"
    puts name.yellow
    puts 'please enter the code:'.yellow
  end

  def render_code(code)
    puts(code)
  end

  def render_error_message(message)
    puts '-----ERROR-----'.red
    puts message.red
    puts 'press enter to continue'.red
    puts '---------------'.red
  end

  def confirm
    puts 'Is this correct? (y/n)'.yellow
    answer = gets.chomp.downcase
    answer == 'y'
  end

  def print_board(board)
    board.each { |line| puts line }
  end

  def print_end_game(player, score)
    puts '--------------------------------------------'.yellow
    puts 'SET OVER'.yellow
    puts '--------------------------------------------'.yellow
    puts player.name.yellow
    puts "Score: #{score}".yellow
    puts '--------------------------------------------'.yellow
  end

  private
end
