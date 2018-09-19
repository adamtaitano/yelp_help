#CLI Controller
class YelpHelp::CLI

  def call
    puts "Yelp Helper Is Here To Help!"
    # list_suggestions
    # navigate
    parse_user_input
    list_user_input
    goodbye
  end

  def list_suggestions
    @suggestions = YelpHelp::Suggestion.all
    @suggestions.each.with_index(1) do |suggestion, i|
      puts "#{i}. #{suggestion.name} - #{suggestion.type} - Rating: #{suggestion.rating}."
    end
  end

  def list_user_input
    @city ? @user_input = @city.to_s + ", " + @state.to_s : @user_input = @zipcode
    @user_input
  end

  def parse_user_input
    input = nil
      ##Ask for user input to refine search location and search type
      puts "Welcome to Yelp Help. Please enter your nearest city, state, or zipcode."
      while input == nil
        input = gets.strip.downcase
        #Determine what type of input - City and State, City, or Zip
        split = input.split(", ")
        if split.size > 1
          @city = split[0]
          @state = split[1]
        elsif input.match? /\A\d+\z/
          @zipcode = input
        elsif input
          @city = input
        else
          puts "Please enter your nearest city, state, or zipcode."
          input = nil
        end
      end
      # puts "Thank you for your input. You typed in: " + input + ". Is this correct?"
  end

  def navigate
    input = nil
    while input != "exit"
      ##Ask for user input to refine search location and search type
      puts "Welcome to Yelp Help. Please enter your nearest city or zipcode."
      input = gets.strip.downcase

      puts "Enter the number of the suggestion you'd like more info on, type list to display list of restaurants, or type exit"
      input = gets.strip.downcase
      if input.to_i > 0
        the_suggestion = @suggestions[input.to_i-1]
        puts "#{the_suggestion.name} - #{the_suggestion.type} - Rating: #{the_suggestion.rating}."
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
