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
  end

  def run_set_loop
  end

  private

  def try_guess(guess)
    @guess = guess

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

    @render.render_code(code)
    code_confirmed = @render.confirm
    set_code unless code_confirmed

    code
  end

  def check_code(code)
    error_message = 'Code must be 5 letters long, and contain only R, G, B, Y'
    return { message: error_message, status_ok: false } unless code.size == 5 && code.match?(/[RGBY]{5}/)

    { message: '', status_ok: true }
  end
end
