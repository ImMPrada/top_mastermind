class Game
  def initialize(score_limit = 6)
    @player1 = nil
    @player2 = nil
    @encrypter = nil
    @hacker = nil
    @current_round = nil
    @rounds = []
    @render = Render.new
    @score_limit = score_limit
  end

  def start
    setup_game
    start_game_loop
  end

  private

  def start_game_loop
    new_round
  end

  def even_round?
    @rounds.size.even?
  end

  def new_round
    @current_round = Round.new(@player1, @player2)
    @current_round.set_roles(@encrypter, @hacker)
    @rounds << @current_round

    next_round if @current_round.start
  end

  def next_round
    @encrypter.add_score(@current_round.turn)
    return end_game if target_score_reached? && even_round?

    change_roles
    new_round
  end

  def end_game
    winner = who_won

    case winner
    when @player1
      @render.winner(@player1, @player2)
    when @player2
      @render.winner(@player2, @player1)
    else
      @render.print_end_game_draw
    end
  end

  def target_score_reached?
    @player1.score >= @score_limit || @player2.score >= @score_limit
  end

  def who_won
    return @player1 if @player1.score > @player2.score
    return @player2 if @player2.score > @player1.score

    :draw
  end

  def setup_game
    @render.print_start_head
    setup_player1
    @render.print_start_head
    setup_player2

    change_roles
  end

  def change_roles
    puts 'Changing roles...'
    change_encrypter
    change_hacker

    @render.print_title
    @render.print_roles(@player1, @player2)
  end

  def setup_player1
    @render.print_name_question('PLAYER 1')
    @player1 = Player.new(gets.chomp.upcase)
    @player1.setup
  end

  def setup_player2
    @render.print_name_question('PLAYER 2')
    @player2 = Player.new(gets.chomp.upcase)
    @player2.setup
  end

  def change_encrypter
    if @encrypter == @player1
      @encrypter = @player2
      @player2.change_role(:encrypter)
    else
      @encrypter = @player1
      @player1.change_role(:encrypter)
    end
  end

  def change_hacker
    if @hacker == @player2
      @hacker = @player1
      @player1.change_role(:hacker)
    else
      @hacker = @player2
      @player2.change_role(:hacker)
    end
  end
end
