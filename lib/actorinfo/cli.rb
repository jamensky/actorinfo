require_relative 'scraper'
require_relative 'actors_class'
require_relative 'user'
require 'pry'

class Cli
  attr_accessor :user_name, :actor, :actor_2, :info, :info_2


  @@all = []

  def initialize

     puts "Hello Mr visitor! What is your name?"
     @user_name = gets.chomp()
     puts "Welcome to Actorinfo #{@user_name}!"


     puts <<-welcome.gsub(/\s+/, " ").strip
       If you are here its probably because you are interested in learning more about your favourite under 40s actor.
       Well, you've come to the best place for that!

       Tell me, who would you want me to talk to you about :))?
     welcome

     @actor = gets.chomp().downcase
     check_and_return(actor)
   end

  def check_and_return(actor)
   if check_actor(actor)
     puts "OMG!!! #{actor.upcase}!! One of my favourites too!!"
     get_info(actor)
   else
     no_actor_found(actor)
   end
  end

   def check_actor(actor)
       Scraper.new.scrape(actor)
   end

  def no_actor_found(actor)
    puts "#{actor.split.first.capitalize()} who? I am sorry, never heard of :( ... lets try someone else ;)"
    actor_3 = gets.chomp().downcase
    check_and_return(actor_3)
  end

  def get_info(actor)

    puts <<-info
     Ok, here's what I can tell you - (enter 1 to 3)

        1. Age
        2. Date of birth
        3. Place of birth
    info

    @info = gets.chomp().to_i

    puts "Ok, hear this out...#{Actor.actor_info(actor, info)}"

    puts <<-info
    Pretty cool huh :))

         Alright, what do you fancy doing next?

           1. Know more about this actor
           2. Try another actor
           3. Exit
    info

    @info_2 = gets.chomp().to_i
    next_option(info_2, actor)
  end

  def next_option(info_2, actor)
    if info_2 == 1
       get_info(actor)
    elsif info_2 == 2
      puts "Ok, who else do you have in mind?"
       @actor_2 = gets.chomp().downcase
      puts "let me see if I have this one...."
       if check_actor(actor_2)
         get_info(actor_2)
       else
         no_actor_found(actor_2)
       end
    elsif info_2 == 3
      puts "Oh such a shame you are going. Come visit us again any time you want :)"
       save_user(user_name, actor)
    end
  end

  def save_user(user_name, actor)
    User.new(user_name, actor)
  end

  def self.all
    @@all
  end

  def self.clear
    @@all.clear
  end

end
