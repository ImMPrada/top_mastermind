class Board
  BLANK_LINE = 'O O O O O  ---  · · · · ·'.freeze

  def initialize
    @board = 12.times.map { BLANK_LINE }
    @render = Render.new
    @board_progress = []
  end

  def print_blank_board
    @render.print_board(@board)
  end

  def update_board(guess_code, check_result)
    @board_progress << "#{guess_code}  ---  #{check_result}"
    @board = @board_progress + (12 - @board_progress.length).times.map { BLANK_LINE }

    @render.print_board(@board)
  end

  private
end
