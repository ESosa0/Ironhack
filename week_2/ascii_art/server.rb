require "sinatra"
require "sinatra/reloader"
require "artii"

get  "/ascii/?:word?/?:font?/?:secret?" do
  @word_input = params[:word]
  @font_input = params[:font]
  @secret = params[:secret]
  @image = '<img src= "/kitten.jpg">'
  @artii = Artii::Base.new
  if @font_input == nil
    @artii
    erb :form
  elsif @font_input == "special" && @secret == "secret"
    @image
  else
    @artii = Artii::Base.new:font => @font_input
    erb :form
  end
  
end

