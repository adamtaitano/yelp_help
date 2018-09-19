class YelpHelp::Suggestion
  attr_accessor :name, :rating, :type
  @@all = []

  def self.all
    #Return a bunch of instances of Suggestion
    suggestion_1 = Suggestion.new
    suggestion_1.name = "Screen Door"
    suggestion_1.rating = "5/5 Stars"
    suggestion_1.type = "Restaurant"
    @@all << suggestion_1

    suggestion_2 = Suggestion.new
    suggestion_2.name = "Masu Sushi"
    suggestion_2.rating = "4.5/5 Stars"
    suggestion_2.type = "Restaurant"
    @@all << suggestion_2

    @@all
  end

end
