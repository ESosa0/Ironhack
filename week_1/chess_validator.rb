require 'pry'

class Board

end



class Rook 
  def initialize 
    @x = x
    @y = y
  end
  def move_right(number_of_spaces)
    @x += number_of_spaces 
    binding.pry
  end
  def move_left(number_of_spaces)
    @x -= number_of_spaces
  end
  def move_down(number_of_spaces)
   @y += number_of_spaces
  end
  def move_up(number_of_spaces)
    @y -= number_of_spaces
  end
end

class BlackRookLeft < Rook
  def initialize
    @x = 0
    @y = 0
  end
end

class WhiteRookLeft < Rook
  def initialize
    @x = 0
    @y = 8
  end
end

class BlackRookRight <Rook
  def initialize
    @x = 8
    @y = 0
  end
end

class WhiteRookRight < Rook
  def initialize
    @x = 8
    @y = 8
  end
end

BlackRookRight.new.move_right(3)


# board_array = [[x, y], [x, y+1], [x, y=2] etc... ]
# Rook starts at [0,0], can move up and down board_array
#put limits on pieces
#hash with position name and coordinates ex: board = {a8: [0,0]}
