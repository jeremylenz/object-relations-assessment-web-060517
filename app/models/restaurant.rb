class Restaurant

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(restaurant_name)
    self.all.find { |rest| rest.name = restaurant_name }
  end

  # INSTANCE METHODS

  def reviews
    # Select all reviews where the restaurant reviewed is this one
    Review.all.select do |review|
      review.restaurant == self
    end
  end

  def customers
    # Go through this restaurant's reviews and collect each customer 
    reviews.collect do |review|
      review.customer
    end.uniq
  end


end
