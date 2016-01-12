class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

# Iteration #0: Create an array of homes

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49),
  Home.new("Erica's place", "Chicago", 5, 60),
  Home.new("Ludo's place", "Eindhoven", 2, 50),
  Home.new("Javier's place", "San Francisco", 2, 100),
  Home.new("Emily's place", "Austin", 4, 45),
  Home.new("Samantha's place", "Minneapolis", 4, 45)
]

#Iteration #1: List of homes
homes.each do |hm|
  puts "Name: #{hm.name}. City: #{hm.city}. Capacity: #{hm.capacity}. Price: #{hm.price} "
end

#Iteration #2: Sorting
puts "How would you like to sort the homes? By price or capacity?"
sort_by_answer = gets.chomp

if sort_by_answer == "price"
  sorted_by_price = homes.sort do |home1, home2|
    home1.price <=> home2.price
  end
  sorted_by_price.each do |hm|
    puts "Name: #{hm.name}. City: #{hm.city}. Capacity: #{hm.capacity}. Price: #{hm.price} "
  end
elsif sort_by_answer == "capacity"
  sorted_by_capacity = homes.sort do |home1, home2|
    home1.capacity <=> home2.capacity
  end
  sorted_by_capacity.each do |hm|
    puts "Name: #{hm.name}. City: #{hm.city}. Capacity: #{hm.capacity}. Price: #{hm.price} "
  end
else 
  puts "Sorry I didn't understand. Here's the unsorted list: Name: #{hm.name}. City: #{hm.city}. Capacity: #{hm.capacity}. Price: #{hm.price} "
end

#Iteration #3: Filter by city
puts "Which city would you like to stay in?"
city_preference = gets.chomp

preferred_city = homes.select do |hm|
  hm.city == city_preference
end
preferred_city.each do |hm|
  puts "You can stay at #{hm.name} located in #{hm.city} for $#{hm.price} per night."
end

#Iteration #4: Average
total_price = preferred_city.reduce(0.0) do |sum, hm|
  sum + hm.price
end

average_price = total_price / preferred_city.length

puts "The average price of homes in #{city_preference}is $#{average_price.to_i} per night."

#Iteration #5: Name your own price
puts "How much would you like to spend on a home?"
preferred_price = gets.chomp

home_price = homes.find do |hm|
  hm.price == preferred_price.to_i
end

puts "The first home that costs $#{preferred_price} is #{home_price.name}."




