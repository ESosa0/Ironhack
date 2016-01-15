require 'pry'

class Board

end



class Rook 
  def initialize
    @initial_x 
    @initial_y 
    @new_x
    @new_y
  end
  def move(destination_x, destination_y)
    @new_x = destination_x
    @new_y = destination_y
    validate_move?
  end
  def validate_move?
    if @initial_x == @new_x && @initial_y != @new_y
      puts "Legal"
    elsif @initial_x != @new_x && @initial_y == @new_y
      puts "Legal"
    else
      puts "Illegal"
    end
  end
end

class BlackRookLeft < Rook
  def initialize
    @initial_x = 0
    @initial_y = 0
  end
end

class BlackRookRight <Rook
  def initialize
    @initial_x = 8
    @initial_y = 0
  end
end

class WhiteRookLeft < Rook
  def initialize
    @initial_x = 0
    @initial_y = 8
  end
end

class WhiteRookRight < Rook
  def initialize
    @initial_x = 8
    @initial_y = 8
  end
end

class Bishop
  def initialize
    @initial_x
    @initial_y
    @new_x
    @new_y
  end
  def move(destination_x, destination_y)
    @new_x = destination_x
    @new_y = destination_y
    validate_move?
  end
  def validate_move?
    if @new_x == @initial_x + 1 && @new_y == @initial_y + 1
      puts "Legal"
    elsif @new_x == @initial_x - 1 && @new_y == @initial_y - 1
      puts "Legal"
    else
      puts "Illegal"
    end
  end
end

class BlackBishopLeft < Bishop
  def initialize
    @initial_x = 2
    @initial_y = 0
  end
end

class BlackBishopRight < Bishop
  def initialize
    @initial_x = 5
    @initial_y = 0
  end
end

class WhiteBishopLeft < Bishop
  def initialize
    @initial_x = 2
    @initial_y = 8
  end
end

class WhiteBishopRight < Bishop
  def initialize
    @initial_x = 5
    @initial_y = 8
  end
end

WhiteBishopLeft.new.move(2,7)





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
