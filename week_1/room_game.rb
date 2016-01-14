require 'pry'

class NewGame
  def initialize(x=0,y=0)
    UserInput.new(x,y)
  end
end

class UserInput
  def initialize(x,y)
    @x = x
    @y = y
    question
  end

  def question
    puts "Where to go? (N,S,E,W)"
    answering
  end

  def answering
    answer = gets.chomp.downcase
    # binding.pry
    if answer == "n"
      Movements.new.go_north(@x,@y)
    elsif answer == "s"
      Movements.new.go_south(@x,@y)
    elsif answer == "e"
      Movements.new.go_east(@x,@y)
    elsif answer == "w"
      Movements.new.go_west(@x,@y)
    else
      puts "I did not understand."
      question    
    end
  end
end

class Movements 
  def go_north(x,y)
    y += 1
    puts x
    puts y
    Options.new(x, y)
  end

  def go_south(x,y)
    y -= 1
    puts x
    puts y
    Options.new(x, y)
  end

  def go_east(x,y)
    x += 1
    puts x
    puts y
    Options.new(x, y)
  end

  def go_west(x,y)
    x -= 1
    puts x
    puts y
    Options.new(x, y)
  end
end
  
class Options
  def initialize(x,y)
    if x == 0 && y == 0
      Hall.new(x,y)
    elsif x==0 && y == 1
      Kitchen.new(x,y)
    elsif x==1 && y == 0
      Bedroom.new(x,y)
    elsif x==0 && y == -1
      Bathroom.new(x,y)
    elsif x==-1 && y == 0
      Balcony.new(x,y)
    else 
      puts "That's not a room. Go back to the beginning."
      # binding.pry
      UserInput.new(x,y)
    end
  end
end

class Space
  def initialize(x,y)
  end
  def ask_again(x,y)
    UserInput.new(x,y).question
  end
  #get some movements
end

class Hall < Space
  def initialize(x,y)
    puts "You're in the hall."
    ask_again(x,y)
  end
end

class Kitchen < Space
  def initialize(x,y)
    puts "You're in the kitchen."
    ask_again(x,y)
  end
end

class Bedroom < Space
  def initialize(x,y)
    puts "You're in the bedroom."
    ask_again(x,y)
  end
end

class Bathroom < Space
  def initialize(x,y)
    puts "You're in the bathroom."
    ask_again(x,y)
  end
end

class Balcony < Space
  def initialize(x,y)
    puts "You're on the balcony."
    ask_again(x,y)
  end
end

NewGame.new

# binding.pry