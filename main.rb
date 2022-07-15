#knight_moves([3,3],[4,3])

def board()
  spaces = [0,1,2,3,4,5,6,7].repeated_permutation(2).to_a
end

def print_board(spaces, game_board=[])
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

def make_moves(starting, moves=[], turns=[], spaces)
  p "Starting with: #{starting}"
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
  p keep_legal_first_visit(spaces, moves)
  turns << moves
end

def all_possible_moves(turns, finish, spaces)
  turns.each_with_index do |turn, index|
    turn.each do |move|
      if move == finish
        return turns
      end 
      make_moves(move, moves=[], turns, spaces)
    end
  end

  
  #end 
  #moves.each do |move|  
  #  possible_moves(move, finish, moves=[], turns, spaces)
  #end 
  return turns 
end

def knight_moves(starting, finish, turns, spaces)
  return if starting == finish
  return
end

def keep_legal_first_visit(spaces, moves)
  moves.keep_if {|move| legal_move?(move, spaces)}
  moves
  moves.keep_if {|move| first_visit?(move, moves)}
  return moves
end

def legal_move?(move, spaces)
  return true if spaces.include?(move)

  false
end

def first_visit?(move, moves)
  return true if !moves.include?(move)

  true
end
p spaces = board() 
#p make_moves([4,2], spaces)
#p legal_move?([3,3], spaces)
all_possible_moves([[[1,1],[3,4]], [[4,6],[7,3]], [[2,4],[3,3]]], [5,3], spaces)