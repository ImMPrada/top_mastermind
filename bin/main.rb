require 'colorize'
require 'tty-font'
require 'byebug'

require_relative '../lib/render'
require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/set'
require_relative '../lib/game'

system 'clear'
game = Game.new
game.setup_game
