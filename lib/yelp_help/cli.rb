#CLI Controller
class YelpHelp::CLI

  def call
    puts "Yelp Helper Is Here To Help!"
    list_restaurant
    navigate
    goodbye
  end

  def list_restaurant
    puts "Screen Door 5/5 Stars"
  end

  def navigate
    input = nil
    while input != "exit"
    puts "Enter the number of the restaurant you'd like more info on, type list to display list of restaurants, or type exit"
    input = gets.strip.downcase
      case input
      when "1"
        puts "More info on restaurant 1..."
      when "2"
        puts "More info on restaurant 2..."
      when "list"
        list_restaurant
      else
        puts "Not sure what you want, please type list or exit"
      end
    end
  end

  def goodbye
    puts "Thank you for using yelp help !"
  end

end
