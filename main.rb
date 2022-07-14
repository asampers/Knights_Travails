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

def possible_moves(starting, finish, moves=[], turns=[], spaces)
  p "Starting with: #{starting}"
  i = starting.clone[0]
  j = starting.clone[1]

  p moves << move = [i + 1, j + 2] 
  p moves << move2 = [i +2, j +1] 
  p moves << move3 = [i-1, j-1] 
  p moves << move4 = [i-2, j-2]
  moves
  p "This is after legal moves"
  p keep_legal_first_visit(spaces, moves)
  turns << moves
  if moves.include?(finish)
    p turns
    return turns
  else
    moves.each do |move|
      possible_moves(move, finish, moves=[], turns, spaces)
    end  
  end
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
possible_moves([0,0], [3,3], spaces)
p legal_move?([3,3], spaces)