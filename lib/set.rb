class Set
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @render = Render.new
    @board = Board.new
    @turn = 0
  end

  def set_roles(encrypter, hacker)
    @encrypter = encrypter
    @hacker = hacker
  end

  def start
    @target_code = set_code
    @render.print_title if @target_code
    @render.print_roles(@player1, @player2)
    @board.print_blank_board

    run_set_loop
  end

  def run_set_loop
    @guess_code = nil
    try_guess

    @turn += 1
  end

  private

  def try_guess
    @guess_code = set_code
    check_result = check_guess
    @board.update_board(transpile_code(@guess_code), check_result)
  end

  def check_guess
    success_code = %w[· · · · ·]

    @target_code.split('').each_with_index do |letter, index|
      success_code[index] = '+'.green if letter == @guess_code[index]
    end

    success_code.join(' ')
  end

  def set_code
    @render.ask_for_code(@hacker.name)
    code = gets.chomp.upcase
    check = check_code(code)

    unless check[:status_ok]
      @render.render_error_message(check[:message])
      gets.chomp
      set_code
    end

    @render.render_code(transpile_code(code))
    code_confirmed = @render.confirm
    set_code unless code_confirmed

    code
  end

  def check_code(code)
    error_message = 'Code must be 5 letters long, and contain only R, G, B, Y'
    return { message: error_message, status_ok: false } unless code.size == 5 && code.match?(/[RGBY]{5}/)

    { message: '', status_ok: true }
  end

  def transpile_code(code)
    code_arr = code.split('')
    code_colors = code_arr.map { |color| transpile_color(color) }

    code_colors.join(' ')
  end

  def transpile_color(used_color)
    return 'O'.light_red if used_color == 'R'
    return 'O'.light_green if used_color == 'G'
    return 'O'.light_blue if used_color == 'B'
    return 'O'.light_yellow if used_color == 'Y'
  end
end
