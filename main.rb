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

def possible_moves(starting=[0,0], finish=[3,3], moves=[], spaces)
  p "This is starting #{starting}"
  i = starting[0]
  j = starting[1]
  p moves << starting
  p moves << move = [i + 1, j + 2] 
  p moves << move2 = [i +2, j +1] 
  p moves << move3 = [i-1, j-1] 
  p moves << move4 = [i-2, j-2]
  p "This is moves #{moves}"
  p "This is after legal moves"
  p keep_legal_first_visit(spaces, moves)
  if moves.include?(finish)
    return moves
  end
  possible_moves(moves[-1], [3,3], spaces)
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
#print_board(spaces)
#moves(game_board)
#puts "The knight is at #{game_board[2][1]} and wants to end at #{game_board[0][0]}"
p possible_moves(spaces)
p legal_move?([4,4], spaces)