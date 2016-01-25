require 'pry'


class Post
  attr_reader :title, :date, :text

  def initialize (title, date, text)
    @title = title
    @date = date
    @text = text
  end
  def print
    puts @title
    puts "**************"
    puts @text
    puts "----------------" 
  end
end

class SponsoredPost < Post
  def print
    puts "****** #{@title} ******"
    puts "**************"
    puts @text
    puts "----------------" 
  end
end





# puts "Type NEXT or PREV."
# navigate = gets.chomp
# if navigate == "next" || navigate == "NEXT"
#   blog.next_page
# elsif navigate == "prev" || navigate == "PREV"
#   blog.prev_page
# end
# blog.publish_front_page





