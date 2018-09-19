#CLI Controller
class YelpHelp::CLI

  def call
    puts "Yelp Helper Is Here To Help!"
    list_suggestions
    navigate
    goodbye
  end

  def list_suggestions
    YelpHelp::Suggestion.new
    @suggestions = YelpHelp::Suggestion.all
  end

  def navigate
    input = nil
    while input != "exit"
      puts "Enter the number of the suggestion you'd like more info on, type list to display list of restaurants, or type exit"
      input = gets.strip.downcase
      if input.to_i > 0
        puts @suggestions[input.to_i-1]
      elsif input == "list"
        list_suggestions
      else
        puts "Not sure what you want, please type list or exit"
      end
    end
  end

  def goodbye
    puts "Thank you for using yelp help !"
  end

end
