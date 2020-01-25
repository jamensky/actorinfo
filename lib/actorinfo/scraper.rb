require_relative 'actors_class'
require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper 
  
  #attr_accessor :name, :age #, :date_of_birth, :movies, :oscar
 
  @@all = []
  
  def scrape
    
    doc = Nokogiri::HTML(open('https://www.listal.com/list/american-actors-under-40'))
    actor = doc.css('.pure-u-1')
    
    actor.each do |person|
     info_link = Nokogiri::HTML(open(person.css('a')[0]['href']))  # this will open and access a secondary link in the webpage containing further details.
      

      new_actor = Actor.new
      new_actor.name = person.css('a').text.strip 
      new_actor.age = info_link.css('p')[4].css('b')[0].text
      new_actor.dob = info_link.css('p')[4].css('b')[1].text
      new_actor.place_of_b = info_link.css('p')[5].css('b').text
      
      binding.pry 
      
      
    end 

    @@all << self 
  end 
  
  
  def self.all 
    @@all 
  end
  
  
end 



