# Please copy/paste all three classes into this file to submit your solution!

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




class Customer

  @@all = []

  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def add_review(restaurant, content)
    new_review = Review.new(restaurant, content, self)

  end

  # CLASS METHODS
  def self.all
    @@all
  end

  def self.find_by_name(name)
    split_name = name.split(" ") # [first_name, last_name]
    self.all.find { |cust| cust.first_name == split_name[0] && cust.last_name == split_name[1] }
  end

  def self.find_all_by_first_name(frst_name) # Select only the customers whose first name matches
    self.all.select { |cust| cust.first_name == frst_name }
  end

  def self.all_names
    self.all.collect do |cust|
      [cust.first_name, cust.last_name].join(" ")
      # i could have also done it with cust.full_name, oops
    end
  end

end




class Review

  @@all = []

  attr_accessor :restaurant, :text, :customer

  def initialize(restaurant, text, customer)
    self.restaurant = restaurant
    self.text = text
    self.customer = customer
    @@all << self
  end

  def self.all
    @@all
  end




end
