require_relative "scraper.rb"

class Cli
  attr_accessor :name, :actor, :info
  
  @@all = []
  
  def initialize
      
     puts "Hello Mr visitor! What is your name?"
     name = gets.chomp()
     puts "Welcome to Actorinfo #{name}!"  

    
     puts <<-welcome.gsub(/\s+/, " ").strip 
  
       If you are here its probably because you are interested in learning more about your favourite actor or actress... 
       Well, you've come to the best place for that!
    
       Tell me, who would you want me to talk to you about :))?
     welcome
    
     actor = gets.chomp() 
    
     puts "OMG!!! #{actor}!! One of my favourites too!! Ok, here's what I can tell you:"
    
     puts <<-info
    
          1. Oscar wins
          2. Age
          3. Best movies 
    
       Which one interests you the most?"
     info
    
     info = gets.chomp()
    
     @@all << self 
    
  end
  
  def movie_mood
     puts "Tell me, what's your vibe right now? I can recommend you #{actor}'s most suitable movie for you right now :))"
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.clear 
    @@all.clear 
  end 
  
end 



