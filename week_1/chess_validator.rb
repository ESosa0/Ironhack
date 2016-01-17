require 'pry'

class Board
  attr_reader :grid
  def initialize
    br1 = Rook.new(:black)
    br2 = Rook.new(:black)
    wr1 = Rook.new(:white)
    wr1 = Rook.new(:white)
    bq1 = Queen.new(:black)
    wq1 = Queen.new(:white)

    @grid = [
      [br1, nil, nil, nil, bq1, nil, nil, br2],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [nil, nil, nil, nil, nil, nil, nil, nil],
      [wr1, nil, nil, wq1, nil, nil, nil, wr1],
    ]
  end
  def at_position(position) # => [0,0]
    @grid[position[1]][position[0]]
  end
end

class Piece 
  attr_reader :color
  def initialize(color)
    @color = color
  end
end

class Rook < Piece
  # => validate_move?(Board.new, [0,0], [7,0])
  def validate_move?(board, origin, destination)
    origin_x = origin[0]
    origin_y = origin[1]
    destination_x = destination[0]
    destination_y = destination[1]
    piece = board.at_position(destination)
    range_x = origin_x..destination_x
    sorted_x = [origin_x, destination_x].sort
    (sorted_x.first..sorted_x.last).each do |position_x|
      puts "x [#{position_x}, #{destination_y}]"
      if position_x != origin_x && position_x != destination_x && board.at_position([position_x, destination_y]) != nil 
        puts "Illegal move, path is blocked x "
        return false
      end
    end
    
    sorted_y = [origin_y, destination_y].sort
    (sorted_y.first..sorted_y.last).each do |position_y|
      puts "y [#{destination_x}, #{position_y}]"
      if position_y != origin_y && position_y != destination_y && board.at_position([destination_x, position_y]) != nil 
        puts "Illegal move, path is blocked y"
        return false
      end
    end
    if piece && piece.color == self.color
      puts "Illegal move, cannot replace your own piece"
      return false
    elsif piece && piece.color != self.color
      puts "Legal, nice grab!"
      return true
    elsif origin_x == destination_x && origin_y != destination_y
      puts "Legal"
      return true
    elsif origin_x != destination_x && origin_y == destination_y
      puts "Legal"
      return true
    else
      puts "Illegal move, Rooks don't move that way."
      return false
    end
  end
end

class Queen < Piece
  # => validate_move?(Board.new, [0,0], [7,0])
  def validate_move?(board, origin, destination)
    origin_x = origin[0]
    origin_y = origin[1]
    destination_x = destination[0]
    destination_y = destination[1]
    piece = board.at_position(destination)
    range_x = origin_x..destination_x
    sorted_x = [origin_x, destination_x].sort
    (sorted_x.first..sorted_x.last).each do |position_x|
      puts "x [#{position_x}, #{destination_y}]"
      if position_x != origin_x && position_x != destination_x && board.at_position([position_x, destination_y]) != nil 
        puts "Illegal move, path is blocked x "
        return false
      end
    end
    
    sorted_y = [origin_y, destination_y].sort
    (sorted_y.first..sorted_y.last).each do |position_y|
      puts "y [#{destination_x}, #{position_y}]"
      if position_y != origin_y && position_y != destination_y && board.at_position([destination_x, position_y]) != nil 
        puts "Illegal move, path is blocked y"
        return false
      end
    end
    if piece && piece.color == self.color
      puts "Illegal move, cannot replace your own piece"
      return false
    elsif piece && piece.color != self.color
      puts "Legal, nice grab!"
      return true
    elsif origin_x == destination_x && origin_y != destination_y
      puts "Legal"
      return true
    elsif origin_x != destination_x && origin_y == destination_y
      puts "Legal"
      return true
    elsif (destination_x - origin_x).abs == (destination_y - origin_y).abs
      puts "Legal"
      return true
    else
      puts "Illegal move, Queens don't move that way."
      return false
    end
  end
end

board1= Board.new

black_queen = board1.at_position([4,0])
black_queen.validate_move?(board1,[4,0],[2,2])
# black_rook = board1.at_position([7,0])
# white_rook = board1.at_position([0,7])

# white_rook.validate_move?(board1, [0,7], [4,2])



# class Bishop < Piece
#   def validate_move?
#     if @new_x - @initial_x == @new_y - @initial_y
#       true
#       puts "Legal"
#     else 
#       false
#       puts "Illegal"
#     end
#   end
# end

# class BlackBishopLeft < Bishop
#   def initialize
#     @initial_x = 2
#     @initial_y = 0
#   end
# end

# class BlackBishopRight < Bishop
#   def initialize
#     @initial_x = 5
#     @initial_y = 0
#   end
# end

# class WhiteBishopLeft < Bishop
#   def initialize
#     @initial_x = 2
#     @initial_y = 7
#   end
# end

# class WhiteBishopRight < Bishop
#   def initialize
#     @initial_x = 5
#     @initial_y = 7
#   end
# end

# class Queen < Piece
#   def validate_move?
#     if @initial_x == @new_x && @initial_y != @new_y #Rook condition
#       puts "Legal"
#       return true
#     elsif @initial_x != @new_x && @initial_y == @new_y #Rook condition
#       puts "Legal"    
#       return true
    # elsif @new_x - @initial_x == @new_y - @initial_y #Bishop condition
    #   puts "Legal"
    #   return true
#     else 
#       puts "Illegal"
#       return false
#     end
#   end
# end

# class BlackQueen < Queen
#   def initialize
#     @initial_x = 4
#     @initial_y = 0
#   end
# end

# class WhiteQueen < Queen
#   def initialize
#     @initial_x = 3 
#     @initial_y = 7
#   end
# end

# class King < Piece
#   def validate_move?
#     if @new_x == @initial_x + 1 && @new_y == @initial_y 
#      puts "Legal"
#      return true
#     elsif @new_x == @initial_x - 1 && @new_y == @initial_y
#       puts "Legal"
#       return true
#     elsif @new_y == @initial_x + 1 && @new_y == @initial_y
#      puts "Legal"
#      return true
#     elsif @new_y == @initial_y -1 && @new_y == @initial_y
#       puts "Legal"
#       return true
#     elsif @new_x == @initial_x + 1 && @new_y == @initial_y + 1 
#      puts "Legal"
#      return true
#     elsif @new_x == @initial_x + 1 && @new_y == @initial_y - 1 
#       puts "Legal"
#       return true
#     elsif @new_x == @initial_x - 1 && @new_y == @initial_y - 1
#       puts "Legal"
#       return true
#     elsif @new_x == @initial_x - 1 && @new_y == @initial_y + 1 
#       puts "Legal"
#       return true
#     else
#       puts "Illegal"
#       return false
#     end
#   end
# end

# class BlackKing < King
#   def initialize
#     @initial_x = 3
#     @initial_y = 0
#   end
# end

# class WhiteKing < King
#   def initialize
#     @initial_x = 4 
#     @initial_y = 7
#   end
# end



#BlackKing.new.move(4,ß2)

# WhiteQueen.new.move(0,5)

# BlackRookLeft.new.move(1,0)

# BlackBishopLeft.new.move(5,4)



  # def move_right(number_of_spaces)
  #   @x += number_of_spaces 
  #   binding.pry
  # end
  # def move_left(number_of_spaces)
  #   @x -= number_of_spaces
  # end
  # def move_down(number_of_spaces)
  #  @y += number_of_spaces
  # end
  # def move_up(number_of_spaces)
  #   @y -= number_of_spaces
  # end
# end






# board_array = [[x, y], [x, y+1], [x, y=2] etc... ]
# Rook starts at [0,0], can move up and down board_array
#put limits on pieces
#hash with position name and coordinates ex: board = {a8: [0,0]}
