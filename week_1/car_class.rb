require 'pry'

class Car
  attr_reader :city

  def self.sound_twice(car)
    2.times {car.add_sound}
  end
  def initialize(sound)
    @sound = sound
    @city = []
    end
  def add_sound
    puts @sound
  end
  def add_cities(city)
    @city.push(city)
  end
  def cities_visited
    puts @city
  end
  def write_file
    IO.write("car_info.txt", @city)
  end
end

class Racing_car < Car
  def initialize
  end
  def add_sound
    puts "BROOM"
  end
  def self.sound_twice(car)
    2.times {car.add_sound}
  end
end

rcar1 = Racing_car.new
rcar1.add_sound
Racing_car.sound_twice

soft_car = Car.new("Broom")
loud_car= Car.new("BROOOOOOM")


# soft_car.add_sound
# loud_car.add_sound

# Car.sound_twice(soft_car)
# Car.sound_twice(loud_car)

# soft_car.add_cities("Madrid")
# soft_car.add_cities("Barcelona")
# soft_car.add_cities("Tokyo")

# loud_car.add_cities("Miami")
# loud_car.add_cities("New York")
# loud_car.add_cities("Chicago")

# soft_car.cities_visited
# loud_car.cities_visited

# soft_car.write_file





# ["Madrid", "Barcelona", "Miami"]
# ["Chicago", "Tokyo", "New York"]