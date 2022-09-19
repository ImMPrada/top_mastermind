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
    code_setted_up = setup_code
    puts code_setted_up
    # @board.print_board
  end

  private

  def setup_code
    @render.ask_for_code(@hacker.name)
    @code = gets.chomp.upcase
    check = check_code(@code)

    unless check[:status_ok]
      @render.render_error_message(check[:message])
      gets.chomp
      setup_code
    end

    @render.render_code(@code)
    setup_code unless @render.confirm

    true
  end

  def check_code(code)
    error_message = 'Code must be 5 letters long, and contain only R, G, B, Y'
    return { message: error_message, status_ok: false } unless code.size == 5 && code.match?(/[RGBY]{5}/)

    { message: '', status_ok: true }
  end
end
