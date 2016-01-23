require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'imdb'
require './lib/logic.rb'

get '/' do 
  erb :form 
end

post '/search_keyword' do 
  @keyword = params[:keyword]
  @search = Imdb::Search.new(@keyword) 
  movies_with_poster = @search.movies[0..20].select { |movie| movie.poster != nil} 
  @movie_list = movies_with_poster[0..8]
  erb :posters
end

post '/answer' do
  id = params[:id]
  movie = Imdb::Movie.new(id)
  if movie.year >= 1990 && movie.year <= 1999 
    "Correct"
  else
    "Incorrect"
  end
end