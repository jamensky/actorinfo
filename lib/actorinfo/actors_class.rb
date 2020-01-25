#require_reative 'scraper'
require 'pry'


class Actor
  attr_accessor :name, :age, :dob, :place_of_b
  
  @@all = []
  
  def initialize
    @@all << self 
  end 
  
end 
  