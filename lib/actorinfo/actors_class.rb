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
  
  def self.find(actor_name)
    Actor.all.each {|actor| actor.name == actor_name}
    binding.pry 
  end 
  
end 
  