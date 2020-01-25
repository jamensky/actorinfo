require 'actors_class'
require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper 
  
  attr_accessor :name, :age #, :date_of_birth, :movies, :oscar
 
  @@all = []
  
  def scrape
    
    doc = Nokogiri::HTML(open('https://www.listal.com/list/american-actors-under-40'))
    actor = doc.css('.pure-u-1')
    
    actor.each do |person|
      info_link = person.css('a')[0]['href'] # this access a secondary link on the webpage with further details

      new_actor = Actor.new
      new_actor.name = person.css('a').text.strip 
      new_actor.age = doc_2 = Nokogiri::HTML(open(details)).css('p')[4].css('b')[0].text
      
      binding.pry 
      
      
    end 
=begin
    details = actor.css('a')[0]['href']
    doc_2 = Nokogiri::HTML(open(details))
    
    @age = doc_2.css('p')[4].css('b')[0].text
=end 
    
    @@all << self 
  end 
  
  
  def self.all 
    @@all 
  end
  
  
end 



