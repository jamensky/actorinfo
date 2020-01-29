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
       If you are here its probably because you are interested in learning more about your favourite actor.
       Well, you've come to the best place for that!

       Tell me, who would you want me to talk to you about :))?
     welcome

     @actor = gets.chomp().downcase

    while check_and_return_actor(actor) == nil
      #binding.pry
     if check_and_return_actor(actor)
        check_and_return_actor(actor)
        break
     else
        puts "#{@actor.split.first.capitalize()} who? I am sorry, never heard of :( ... Why don't you try someone else? (type yes or no)"
        answer = gets.chomp().to_s.downcase
         if answer == "yes"
           puts "Ok, shoot another name ;)"
           @actor = gets.chomp().downcase
           check_and_return_actor(actor)
         elsif answer == "no"
           puts "Oh what a shame you are going :( Try come back in few days - I am sure we will have your actor available ;)"
           break
         end
     end

   end
   end

   def check_and_return_actor(actor)
     if Scraper.new.scrape(actor)
       puts "OMG!!! #{@actor}!! One of my favourites too!! Ok, here's what I can tell you."

       puts <<-info

            1. Age
            2. Date of birth
            3. Place of birth

         Which one interests you the most? enter a digit from 1 to 4."
       info

       @info = gets.chomp().to_i
       get_info(actor, info)
     end
  end

  def get_info(actor, info)
    puts "Ok, hear this out...#{Actor.actor_info(actor, info)}"
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
