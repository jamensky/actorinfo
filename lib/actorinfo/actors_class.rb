require_reative 'scraper'
require 'pry'


class Actors 
  attr_accessor :name, :age
  
  @@all = []
  
  def initialize
    @@all << self 
  end 
  
end 
  