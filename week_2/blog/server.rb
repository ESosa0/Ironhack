require "sinatra"
require "sinatra/reloader"
require_relative('lib/blog.rb')
require_relative('lib/post.rb')
require_relative('spec/blog_spec.rb')
require_relative('spec/post_spec.rb')


get "/" do
  @blog = Blog.new
  @blog.add_post Post.new("Wine and Cheese", Time.new(2015, 10, 31), "Never overpower your delicate wine with a strong cheese, or vice versa." )
  @blog.add_post SponsoredPost.new("Cooking the Perfect Steak", Time.new(2015, 11, 30), "Medium rare is the best. It should have a warm red center.")
  @blog.add_post Post.new("Secrets of Winter Meals", Time.new(2016, 01, 05), "Use lots of root vegetables. You can find them locally even if you live in a cool climate.")
  @blog.add_post Post.new("Slow Cooking for Dummies", Time.new(2016, 01, 15), "You can't cook chicken or fish all day; they will turn to mush.")
  erb :front_page 
end

#instances of blog live here