class Set
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Board.new
    @turn = 0
  end

  def start
    @board.print_board
  end
end
