#CLI Controller
class YelpHelp::CLI
  attr_reader :city, :user_input, :location, :zipcode, :untouched_location, :untouched_type, :user_location, :user_type

  def call
    puts "Welcome to Yelp Help! We provide you with some great suggestions!"
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

  def parse_user_location
    input = nil
      ##Ask for user input to refine search location and search type
      puts "Please enter your nearest city, state, or zipcode."
      while input == nil
        @untouched_location = gets.chomp
        input = @untouched_input.strip.downcase
        #Determine what type of input - City and State, City, or Zip
        @user_location = input.split(", ")
        if split.size > 1
          @city = split[0]
          @state = split[1]
        elsif input.match? /\A\d+\z/
          @zipcode = input
        elsif input
          @location = input
        else
          puts "I'm sorry I didn't get that. Please re-enter your nearest city, state, or zipcode."
          input = nil
        end
      end
      input = list_user_input[0]
      puts "Thank you for your input. You typed in: #{@untouched_location}. Is this correct? (y/n)"
      answer = gets.chomp.downcase
      if answer == 'y'
        parse_user_type
      elsif answer == 'n'
        parse_user_location
      end
    # list_user_input
  end

  def parse_user_type
    input = nil
    #Ask for user recommendation type
    puts "Now please enter a business type (e.g. Restaurants, Burgers, Car Repair, Home Services) and we will provide you with recommendations!"
    while input == nil
      @untouched_type = gets.chomp
      input = @untouched_type.strip.downcase
      #split string to separate words
      split = input.split(" ")
      @user_type = split.join("+")
      if @user_type.is_a? String
        puts "You typed in: #{@untouched_type}. Is this correct? (y/n)"
        answer = gets.chomp.downcase
        if answer == 'y'
          enter_user_input
        elsif answer == 'n'
          parse_user_type
        end
      end
    end
  end

  def enter_user_input
    instance = YelpHelp::Suggestion.new(@user_location, @user_type)
    instance.scrape_suggestions
    instance.present_list_of_names
    list_count = 1
    puts "Enter the number of the business for more information. Type 'more' for additional recommendations. Press 'q' to quit."
    answer = gets.chomp.strip.downcase
    if answer == "more"
      list_count += 5
      instance.present_list_of_names(list_count, list_count+5)
    elsif answer == "q"
      break
    else
      puts "I'm sorry, I didn't get that. Please enter the number for more infomation, type 'more' for extra recommendations, or 'q' to quit."
    end
  end

  def list_user_input
    @city ? @user_location = @city.to_s + ", " + @state.to_s : @user_location = @zipcode
    [@user_location, @user_type]
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
