require "sinatra"
require "sinatra/reloader"
require "./lib/calculator"

get "/" do
  erb :homepage
end

post "/calculate" do
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  operation = params[:operation]
  calculator = Calculator.new
  if operation == "addition"
    @result = calculator.add(first,second)
  elsif operation == "subtraction"
    @result = calculator.subtract(first,second)
  elsif operation == "multiplication"
    @result = calculator.multiply(first,second)
  elsif operation == "division"
    @result = calculator.divide(first,second)
  end
  erb :add
end


