require 'colorize'
require 'tty-font'

require_relative 'mastermind'
require_relative 'game'
require_relative 'player'
require_relative 'set'
require_relative 'board'

system 'clear'
game = Mastermind::Game.new
game.setup_game
board = Board.new
