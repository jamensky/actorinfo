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

  def self.find_actor(actor_name)
    Actor.all.each{|actor| actor.name == actor_name}
  end

  def self.actor_info(name, info)
    Actor.find_actor(name).info
  end

end
