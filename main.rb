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

  def knight_moves(starting, finish, turns, spaces)
    
    
  end

end

class Board
  attr_reader :spaces

  def initialize
    @spaces = board()
  end

  def board()
    [0,1,2,3,4,5,6,7].repeated_permutation(2).to_a
  end

end

class Knight < Game
  
  attr_accessor :location, :turns, :visited

  def initialize
    @location = [nil,nil]
    @turns = []
    @visited= Hash.new
  end

  def keep_legal_first_visit(spaces, moves, turns)
    moves.keep_if {|move| legal_move?(move, spaces)}
    moves
    moves.keep_if {|move| first_visit?(move, turns)}
    return moves
  end

  def legal_move?(move, spaces)
    return true if spaces.include?(move)

    false
  end

  def first_visit?(move, turns)
    turns.each do |turn| 
      if turn.include?(move)
        return false
      end 
    end 
    true  
  end

  def make_first_move(starting, finish, turns, visited, spaces)
    return if turns.any?
    make_moves(starting, finish, turns, visited, spaces) 
  end

  def make_moves(starting, finish, moves=[], turns, visited, spaces)
    return if turns.include?(finish)
    @location = [starting[0], starting[1]]

    puts "From #{@location} the knight could get to:"
    i = starting.clone[0]
    j = starting.clone[1]

    moves << move = [i+1, j+2] 
    moves << move2 = [i+2, j+1] 
    moves << move3 = [i-1, j-2] 
    moves << move4 = [i-2, j-1]
    moves << move5 = [i+1, j-2]
    moves << move6 = [i+2, j-1]
    moves << move7 = [i-1, j+2]
    moves << move8 = [i-2, j+1]
    moves
    p keep_legal_first_visit(spaces, moves, turns)
    moves
    visited[starting] = moves unless moves.empty?
    turns << moves unless moves.empty? 
    
  end

  def make_all_possible_moves(starting, finish, turns=@turns, visited=@visited, spaces)
      
      make_first_move(starting, finish, turns, visited, spaces)
      turns.each_with_index do |turn, index|
          if turn.include?(finish)
            #puts "The finish is in index #{index}"
            return 
          end  
          turn.each do |move|
            puts "This is index #{index}"
            make_moves(move, finish, moves=[], turns, visited, spaces)
          end   
      end
    
    return visited 
  end

end

#p make_moves([4,2], spaces)
#p legal_move?([3,3], spaces)
#make_all_possible_moves([[[1,1],[3,4]], [[4,6],[7,3]], [[2,4],[3,3]]], [5,3], spaces)

game = Game.new
game.print_board
tim = Knight.new
p game.pieces

tim.make_all_possible_moves([0,0], [2,6], game.board.spaces)
p tim.visited