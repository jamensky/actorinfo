class Actor
  attr_accessor :name, :age, :dob, :place_of_b, :info

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.actor_info(actor_name, info)
    Actor.all.each do |actor|
     if actor.name == actor_name
      if info == 1
        return "He is #{actor.age}! And he doesn't even look it ;)"
      elsif info == 2
        return "you definitely want to mark this on your calendar; His birthday is #{actor.dob}."
      elsif info == 3
        return "Have you ever been to #{actor.place_of_b}? well, that's where he's from :)"
      end
     end
   end

  end

end
