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

  def setup_game
    @render.print_start_head
    setup_player1
    @render.print_start_head
    setup_player2

    change_rols
  end

  def change_rols
    change_encrypter
    change_hacker

    @render.print_title
    @render.print_roles(@player1, @player2)
    new_set
  end

  def new_set
    @current_set = Set.new(@player1, @player2)
    @current_set.set_roles(@encrypter, @hacker)
    @sets << @current_set

    start_game
  end

  def start_game
    @current_set.start
  end

  private

  def setup_player1
    @render.print_player_setup_instructions('PLAYER 1')
    @player1 = Player.new(gets.chomp.upcase)
    @player1.setup
  end

  def setup_player2
    @render.print_player_setup_instructions('PLAYER 2')
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
