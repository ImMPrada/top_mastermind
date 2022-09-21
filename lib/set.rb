class Set
  WINNING_CODE = '+ + + + +'.freeze
  INITIAL_CODE = %w[· · · · ·].freeze

  attr_reader :turn

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @render = Render.new
    @board = Board.new
    @turn = 1
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

    end_set if run_set_loop == :set_over
  end

  private

  def end_set
    @render.print_end_set(@encrypter, @turn)
    true
  end

  def run_set_loop
    @guess_code = nil
    try_guess

    return :set_over if @loop_result.join(' ') == WINNING_CODE || @turn == 12

    @turn += 1
    run_set_loop
  end

  def try_guess
    @guess_code = set_code
    check_guess
    @board.update_board(transpile_code(@guess_code), @loop_result.join(' '))
  end

  def check_guess
    @loop_result = INITIAL_CODE.dup

    guess_code = @guess_code.split('')
    target_code = @target_code.split('')

    check_for_coincidences(guess_code, target_code)
    check_for_color(guess_code, target_code)
  end

  def check_for_coincidences(guess_code, target_code)
    guess_code.each_with_index do |color, index|
      next unless target_code[index] == color

      @loop_result[index] = '+'
      target_code[index] = nil
      guess_code[index] = nil
    end
  end

  def check_for_color(guess_code, target_code)
    guess_code.each_with_index do |color, index|
      match_index = target_code.index(color)
      next unless match_index && color

      @loop_result[index] = '*'
      target_code[index] = nil
      guess_code[index] = nil
    end
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
