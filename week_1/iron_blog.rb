require 'pry'

class Blog

  def initialize
    @container = []
    @page_number = 1
    @items_on_page =3
  end

  def add_post(the_post)
    @container.push(the_post)
    @container.sort_by!(&:date).reverse!
  end

  def publish_front_page
    from = (@page_number - 1) * @items_on_page
    to = from + @items_on_page
    @container[from..to].each do |the_post|
      the_post.print
    end
    puts "#{@page_number} of #{(@container.length/@items_on_page.to_f).ceil}"
  end

  def next_page
    @page_number += 1
  end

  def prev_page
    @page_number -= 1
  end

end

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


blog = Blog.new
blog.add_post Post.new("Wine and Cheese", Time.new(2015, 10, 31), "Never overpower your delicate wine with a strong cheese, or vice versa." )
blog.add_post SponsoredPost.new("Cooking the Perfect Steak", Time.new(2015, 11, 30), "Medium rare is the best. It should have a warm red center.")
blog.add_post Post.new("Secrets of Winter Meals", Time.new(2016, 01, 05), "Use lots of root vegetables. You can find them locally even if you live in a cool climate.")
blog.add_post Post.new("Slow Cooking for Dummies", Time.new(2016, 01, 15), "You can't cook chicken or fish all day; they will turn to mush.")

blog.publish_front_page

puts "Type NEXT or PREV."
navigate = gets.chomp
if navigate == "next" || navigate == "NEXT"
  blog.next_page
elsif navigate == "prev" || navigate == "PREV"
  blog.prev_page
end
blog.publish_front_page





