require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'imdb'
require './lib/my_imdb.rb'

get '/' do 
  erb :form 
end

post '/search_keyword' do 
  my_imdb = MyImdb.new
  my_imdb.search(params[:keyword])
  @movie_list = my_imdb.find_movies_with_poster
  erb :posters
end

post '/answer' do
  id = params[:id]
  my_imdb = MyImdb.new
  result = my_imdb.check_from_90s(id)
  if result == true
    "Correct"
  else
    "Incorrect"
  end
end



#   movie = Imdb::Movie.new(id)
#   if movie.year >= 1990 && movie.year <= 1999 
#     "Correct"
#   else
#     "Incorrect"
#   end
# end