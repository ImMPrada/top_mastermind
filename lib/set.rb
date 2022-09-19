class Set
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2

    @board = Board.new
    @turn = 0
  end

  def set_roles(encrypter, hacker)
    @encrypter = encrypter
    @hacker = hacker
  end

  def start
    
    @board.print_board
  end
end
