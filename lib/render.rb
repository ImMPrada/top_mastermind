class Render
  H1_FONT = TTY::Font.new(:starwars)
  H3_FONT = TTY::Font.new(:straight)
  TITLE = 'MASTERMIND'.freeze

  def print_title
    puts H1_FONT.write(TITLE).cyan
  end

  def print_roles
    puts '--------------------------------------------'.yellow
    puts 'ROLES:'.yellow
    puts "#{@player1.name}: #{@player1.rol}".yellow
    puts "#{@player2.name}: #{@player2.rol}".yellow
    puts '--------------------------------------------'.yellow
  end
end
