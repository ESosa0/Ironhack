class User
  def ask_password 
    print "Please enter your name > "
    name = gets.chomp
    print "Please enter your password > " 
    password = gets.chomp
    check_password(name, password)
  end
  def check_password(name, password)
    if password.include? "a" 
      puts "You are now logged in, #{@name}."
      print "Please enter some text > "
      text = gets.chomp
      count_words(text)
    else
      puts "Sorry, your password must contain the letter 'a'."
      ask_password
    end
  end
  def count_words(text)
     text_array = text.split(' ')
     number_of_words = text_array.count 
     puts "You have entered #{number_of_words} words."
  end
end

User.new.ask_password
