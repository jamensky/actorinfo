require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper 
  
 # attr_accessor :name, :age, :date_of_birth, :movies, :oscar
  
  def scraped_act
    
    doc = Nokogiri::HTML(open('https://www.listal.com/list/american-actors-under-40'))
    actor = doc.css('.pure-u-1').first
    actor_name = actor.css('a').text
    binding.pry 
    
  end 
  
  
  def actor_details
=begin   
    scraped_act.each do |actor|
      
    @name = actor.css()

    @age = doc.css()
    @date_of_birth = doc.css()
    @movies = doc.css()   
    @oscar = doc.css()
=end    
  end
  
end 




