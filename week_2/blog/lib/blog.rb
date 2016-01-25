require 'pry'


class Blog
  attr_reader :container, :page_number, :items_on_page

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