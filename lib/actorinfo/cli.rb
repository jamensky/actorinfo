require_relative 'scraper'
require_relative 'actors_class'
require_relative 'user'
require 'pry'

class Cli
  attr_accessor :name, :actor, :actor_2, :info, :info_2


  @@all = []

  def initialize

     puts "Hello Mr visitor! What is your name?"
     @name = gets.chomp()
     puts "Welcome to Actorinfo #{@name}!"


     puts <<-welcome.gsub(/\s+/, " ").strip
       If you are here its probably because you are interested in learning more about your favourite under 30 actor actor.
       Well, you've come to the best place for that!

       Tell me, who would you want me to talk to you about :))?
     welcome

     @actor = gets.chomp().downcase

      if !check_and_return_actor(actor)
        puts "#{@actor.split.first.capitalize()} who? I am sorry, never heard of :( ... Why don't you try someone else..."

      else
        puts "yes"
      end

   end


   def check_and_return_actor(actor)
     if Scraper.new.scrape(actor)
       puts "OMG!!! #{actor.upcase}!! One of my favourites too!! Ok, here's what I can tell you."

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

    puts <<-info
    Pretty cool huh :))

         Alright, what do you fancy doing next?

           1. Know more about this actor
           2. Try another actor
           3. Exit
    info

    @info_2 = gets.chomp().to_i

    if info_2 == 1
       check_and_return_actor(actor)
    elsif info_2 == 2
      puts "Ok, who else do you have in mind?"
       @actor_2 = gets.chomp().downcase
      puts "let me see if I have this one...."
       check_and_return_actor(actor_2)
    elsif info_2 == 3
      "Oh such a shame you are going. Come visit us again soon :)"
       save_user(name, actor)
    end
  end


  def save_user(name, actor)
    User.new(name, actor)
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

=begin
check_and_return_actor(actor)
break
else
puts "#{@actor.split.first.capitalize()} who? I am sorry, never heard of :( ... Why don't you try someone else? (type yes or no)"
re_try = gets.chomp().to_s.downcase
 if re_try == "yes"
   puts "Ok, shoot another name ;)"
   @actor = gets.chomp().downcase
   check_and_return_actor(actor)
 elsif re_try == "no"
   puts "Oh what a shame you are going :( Try come back in few days - I am sure we will have your actor available ;)"
   break
 end

=end
