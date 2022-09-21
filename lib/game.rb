class Game
  def initialize
    @player1 = nil
    @player2 = nil
    @encrypter = nil
    @hacker = nil
    @current_set = nil
    @sets = []
    @render = Render.new
  end

  def start
    setup_game
    start_game_loop
  end

  private

  def start_game_loop
    new_set
  end

  def new_set
    @current_set = Set.new(@player1, @player2)
    @current_set.set_roles(@encrypter, @hacker)
    @sets << @current_set

    update_game_loop if @current_set.start
  end

  def setup_game
    @render.print_start_head
    setup_player1
    @render.print_start_head
    setup_player2

    change_roles
  end

  def change_roles
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
      @player2.change_rol(:encrypter)
    else
      @encrypter = @player1
      @player1.change_rol(:encrypter)
    end
  end

  def change_hacker
    if @hacker == @player2
      @hacker = @player1
      @player1.change_rol(:hacker)
    else
      @hacker = @player2
      @player2.change_rol(:hacker)
    end
  end
end
