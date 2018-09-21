class YelpHelp::Suggestion
  attr_accessor :name, :location, :search_type, :instance_data
  @@all_data = []
  #Initialize Suggestion using user input
  def initialize(location = [nil], search_type = "")
    #Set URL based on user input
    @instance_data = []
    @location = ["il"]
    @search_type = "pancakes"
    @url = "https://www.yelp.com/search?find_desc=#{@search_type}&find_loc=#{@location[0]}%2C+#{@location[1]}&ns=1"
  end
  #Scrape yelp based on user input
  def scrape_suggestions
    #go to yelp, enter url based on input data
    puts @url
    doc = Nokogiri::HTML(open(@url, 'User-Agent' => 'Ruby/2.4.1'))
    data_array = doc.search("li.regular-search-result")
    ##Iterate on each element of suggestions_array to create data hash objects
    suggestion_hash = data_array.each_with_index.map{|data, index| {
      "number" => index + 1,
      "title" => data.search("a.biz-name span").text,
      "rating" => data.search("div.i-stars")[0].values[1],
      "price" => data.search("span.price-range").text,
      "category_list" => data.search("span.category-str-list a[href]").text.split(/(?=[A-Z])/),
      "address" => data.search("div address").text.strip,
      "neighborhood" => data.search("span.neighborhood-str-list").text.strip,
      "snippet" => data.search("p.snippet").text.strip
      }
    }
    #label suggestion_hash with search criteria
    suggestion_hash.unshift({"location" => @location, "search_type" => @search_type})
    @@all_data << suggestion_hash
    @instance_data << suggestion_hash
  end

  def self.all
    @@all_data
  end
  #present list of suggestion names
  def present_list_of_names(first = 1, last = 5)
    @instance_data[first..last].each do |hash|
      puts "#{hash.number}. " + "#{hash.title}" + " - #{hash.rating}."
    end
  end
  #present one suggetion result to cli
  def present_single_suggestion
  end

end
