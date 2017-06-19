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
