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

  def print_player_setup_instructions(player_caption)
    puts H3_FONT.write("#{player_caption}:").yellow
    puts "\n"
    puts 'Please enter your name:'.yellow
  end

  def print_roles(player1, player2)
    puts '--------------------------------------------'.yellow
    puts 'ROLES:'.yellow
    puts "#{player1.name} -- #{player1.rol}".yellow
    puts "#{player2.name} -- #{player2.rol}".yellow
    puts '--------------------------------------------'.yellow
    puts "\n"
  end

  def ask_for_code(name)
    puts "\n"
    puts name.yellow
    puts 'please enter the code:'.yellow
  end

  def render_code(code)
    code_arr = code.split('')
    code_colors = code_arr.map { |color| transpile_color(color) }

    puts(code_colors.join(' '))
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

  private

  def transpile_color(used_color)
    return 'O'.light_red if used_color == 'R'
    return 'O'.light_green if used_color == 'G'
    return 'O'.light_blue if used_color == 'B'
    return 'O'.light_yellow if used_color == 'Y'
  end
end
