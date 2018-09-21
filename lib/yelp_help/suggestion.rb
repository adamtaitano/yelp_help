class YelpHelp::Suggestion
  attr_accessor :name, :location, :search_type, :instance_data, :suggestion
  @@all_data = []
  #Initialize Suggestion using user input
  def initialize(location = [nil], search_type = "")
    #Set URL based on user input
    @instance_data = [nil]
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
    suggestions_array = data_array.map.with_index {|data, index| {
        list_number: index + 1,
        title: data.search("a.biz-name span").text,
        rating: data.search("div.i-stars")[0].values[1],
        price: data.search("span.price-range").text,
        category_list: data.search("span.category-str-list a[href]").text.split(/(?=[A-Z])/),
        address: data.search("div address").text.strip,
        neighborhood: data.search("span.neighborhood-str-list").text.strip,
        snippet: data.search("p.snippet").text.strip
      }
    }
    suggestions_array
    #label suggestion_hash with search criteria
    suggestions_array.unshift({"location" => @location, "search_type" => @search_type})
    @@all_data << suggestions_array
    @instance_data = suggestions_array
  end

  def self.all
    @@all_data
  end
  #present list of suggestion names
  def present_list_of_names(first = 1, last = 5)
    @instance_data[first,last-first+1].each do |hash|
      puts "#{hash[:list_number]}. " + "#{hash[:title]}" + " - #{hash[:rating]}."
    end
  end
  #present one suggetion result to cli
  def present_single_suggestion(list_number = 1)
    suggestion = @instance_data.select{|suggestion| suggestion[:list_number] == list_number}
    hash = suggestion[0]
    puts "#{hash[:list_number]}. #{hash[:title]} - #{hash[:rating]}"
    puts "Price Range: #{hash[:price]} out of $$$"
    puts "Category: #{hash[:category_list]}."
    puts "Neighborhood: #{hash[:neighborhood]}."
    puts "Address: #{hash[:address]}."
    puts "Description snippet: #{hash[:snippet]}."
    binding.pry
  end

end
