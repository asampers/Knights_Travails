require_relative './knight'
require_relative './board'

class Game
  attr_accessor :board, :pieces

  def initialize()
    @board = Board.new
    @pieces = Knight.new
  end

  def print_board(spaces=@board.spaces, game_board=[])
    i = 0
    while i < spaces.length 
      game_board << spaces[i..i+7]
      i += 8
    end
    game_board  
    i = 7
    while i >= 0
      p game_board[i]
      i -= 1
    end  
  end

  def knight_moves(starting, finish, spaces=self.board.spaces)
    @pieces.make_all_possible_moves(starting, finish, spaces)
    times = find_path(visited=@pieces.visited, times=0, moves=[], current=finish.clone, starting)
  
    puts "You made it in #{times} moves! Here's your path:"
    p moves << finish
    clear_pieces_values(finish)
  end

  def clear_pieces_values(finish)
    @pieces.location = finish
    @pieces.visited = {}
    @pieces.turns = []
  end

  def find_path(visited, times, moves, current, starting)
    until moves.include?(starting)
      visited.each_pair do |key, value|
          if value.include?(current)
            current = key
            moves.unshift(key)
            times +=1
            return times if current == starting
          end 
      end
    end         
  end

end
