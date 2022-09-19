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
    setup_code
    # @board.print_board
  end

  private

  def setup_code
    @render.ask_for_code(@hacker.name)
    @code = gets.chomp.upcase
    @render.render_code(@code)
  end
end
