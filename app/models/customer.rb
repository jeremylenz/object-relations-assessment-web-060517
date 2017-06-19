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
