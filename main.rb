


require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/knight'





game = Game.new
game.print_board

game.knight_moves([3,3], [4,3])

p game.pieces.visited
p game.pieces.location
p game.pieces.turns