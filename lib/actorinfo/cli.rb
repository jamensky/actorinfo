require_relative 'scraper'
require_relative 'actors_class'
require 'pry'

class Cli
  attr_accessor :name, :actor, :info
  
  
  @@all = []
  
  def initialize 
      
     puts "Hello Mr visitor! What is your name?"
     @name = gets.chomp()
     puts "Welcome to Actorinfo #{@name}!"  

    
     puts <<-welcome.gsub(/\s+/, " ").strip 
  
       If you are here its probably because you are interested in learning more about your favourite actor or actress... 
       Well, you've come to the best place for that!
    
       Tell me, who would you want me to talk to you about :))?
     welcome
    
     @actor = gets.chomp() 
    
     puts "OMG!!! #{@actor}!! One of my favourites too!! Ok, here's what I can tell you."
    
     puts <<-info
    
          1. Age
          2. Date of birth
          3. Place of birth 
    
       Which one interests you the most? enter a digit from 1 to 4."
     info
    
     @info = gets.chomp()
     
     puts "Ok, hear this out..."
     
     
    
     @@all << self 
    
  end
  
  def get_info 
    Actors.find
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



