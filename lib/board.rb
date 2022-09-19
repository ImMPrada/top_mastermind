class Board
  BLANK_LINE = 'O O O O O  ---  * * * * *'.freeze

  def initialize
    print_board
  end

  private

  def print_board
    12.times { puts BLANK_LINE }
  end
end
