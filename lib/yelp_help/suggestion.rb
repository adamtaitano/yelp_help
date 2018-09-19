class YelpHelp::Suggestion
  attr_accessor :name, :rating, :type
  @@all = []

  #Scrape yelp based on user input
  def self.scrape_suggestions
    suggestions = []
    #go to yelp, enter url based on input data
    doc = Nokogiri::HTML(open("https://yelp.com"))
    binding.pry
    #extract suggestion properties
    #instantiate a suggestion
  end

  def self.all
    #Return a bunch of instances of Suggestion
    suggestion_1 = self.new
    suggestion_1.name = "Screen Door"
    suggestion_1.rating = "5/5 Stars"
    suggestion_1.type = "Restaurant"
    @@all << suggestion_1

    suggestion_2 = self.new
    suggestion_2.name = "Masu Sushi"
    suggestion_2.rating = "4.5/5 Stars"
    suggestion_2.type = "Restaurant"
    @@all << suggestion_2

    @@all
  end

end
