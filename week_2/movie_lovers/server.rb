require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'imdb'
require './lib/search.rb'

get '/' do 
  erb :form 
end

post '/search_keyword' do 
  @keyword = params[:keyword]
  @search = Imdb::Search.new(@keyword)
  erb :posters
end