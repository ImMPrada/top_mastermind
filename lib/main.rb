require 'colorize'
require 'tty-font'

require_relative 'game'
require_relative 'player'

system 'clear'
game = Game.new
game.setup_game
