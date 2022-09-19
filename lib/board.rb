class Board
  BLANK_LINE = 'O O O O O  ---  · · · · ·'.freeze

  def initialize
    @board = 12.times.map { BLANK_LINE }
  end

  def print_board
    @board.each { |line| puts line }
  end
  private
end
