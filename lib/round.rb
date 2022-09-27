class Round
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
    @target_code = enter_code(@encrypter)
    @render.print_title if @target_code
    @render.print_roles(@player1, @player2)
    @board.print_blank_board

    end_round if run_round_loop == :set_over
  end

  private

  def end_round
    @render.print_end_round(@encrypter, @turn)
    true
  end

  def run_round_loop
    @guess_code = nil
    try_guess

    return :set_over if @loop_result.join(' ') == WINNING_CODE || @turn == 12

    @turn += 1
    run_round_loop
  end

  def try_guess
    @guess_code = enter_code(@hacker)
    check_guess
    @board.update_board(colorize_code(@guess_code), @loop_result.join(' '))
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

  def enter_code(player)
    @render.ask_for_code(player.name)
    code = nil || gets.chomp.upcase
    check = check_code(code)

    unless check[:status_ok]
      @render.render_error_message(check[:message])
      enter_code(player)
    end

    @render.render_code(colorize_code(code))
    code_confirmed = @render.confirm
    enter_code(player) unless code_confirmed

    code
  end

  def check_code(code)
    error_message = 'Code must be 5 letters long, and contain only R, G, B, Y'
    return { message: error_message, status_ok: false } unless code.size == 5 && code.match?(/[RGBY]{5}/)

    { message: '', status_ok: true }
  end

  def colorize_code(code)
    code_arr = code.split('')
    code_colors = code_arr.map { |color| transpile_color(color) }

    code_colors.join(' ')
  end

  def transpile_color(used_color)
    case used_color
    when 'R'
      'O'.light_red
    when 'G'
      'O'.light_green
    when 'B'
      'O'.light_blue
    when 'Y'
      'O'.light_yellow
    end
  end
end
