class YelpHelp::Suggestion
  attr_accessor :name, :rating, :type
  @@all = []
  #Initialize Suggestion using user input
  def initialize(location = [nil], search_type = "")
    #Set URL based on user input
    location = ["portland", "or"]
    search_type = "burgers"
    @@url = "https://www.yelp.com/search?find_desc=#{search_type}&find_loc=#{location[0]}%2C+#{location[1]}&ns=1"
  end
  #Scrape yelp based on user input
  def self.scrape_suggestions
    suggestions = []
    #go to yelp, enter url based on input data
    puts @@url
    doc = Nokogiri::HTML(open(@@url, 'User-Agent' => 'Ruby/2.4.1'))
    suggestion_title = doc.search("li.regular-search-result h3.search-result-title")[0].search("a.biz-name").text
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
