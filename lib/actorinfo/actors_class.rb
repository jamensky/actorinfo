#require_reative 'scraper'
require 'pry'


class Actor
  attr_accessor :name, :age, :dob, :place_of_b, :info

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.actor_info(actor_name, info = nil)
    x = []
    Actor.all.each do |actor|
      x << actor.name == actor_name

     if x
      if info == 1
        return actor.name
      elsif info == 2
        return actor.dob
      elsif info == 3
        return actor.place_of_b
      end
     end

   end

  end

end
