require_relative './game'

class Knight 
  
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
    keep_legal_first_visit(spaces, moves, turns)
    moves
    visited[starting] = moves unless moves.empty?
    turns << moves unless moves.empty? 
  end

  def make_all_possible_moves(starting, finish, turns=@turns, visited=@visited, spaces)
      make_first_move(starting, finish, turns, visited, spaces)
      turns.each_with_index do |turn, index|
          if turn.include?(finish)
            return 
          end  
          turn.each do |move|
            make_moves(move, finish, moves=[], turns, visited, spaces)
          end   
      end
    return visited 
  end

end