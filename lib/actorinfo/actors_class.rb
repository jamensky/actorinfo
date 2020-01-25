#require_reative 'scraper'
require 'pry'


class Actor
  attr_accessor :name, :age, :dob, :place_of_b
  
  @@all = []
  
  def initialize
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def find(actor_name)
    @@all.each do {|actor| actor.name == actor_name}
  end 
  
end 
  