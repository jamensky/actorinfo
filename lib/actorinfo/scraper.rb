require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper 
  
  attr_accessor :name, :age, :date_of_birth, :movies, :oscar

  def scraped_actors
    doc = Nokogiri::HTML(open("https://www.businessinsider.com/50-best-actors-working-today-2018-3?r=US&IR=T#tom-hanks-7"))
    binding.pry 
     
    @name = doc.css()  
    @age = doc.css()
    @date_of_birth = doc.css()
    @movies = doc.css()   
    @oscar = doc.css()   
       
  end 
  
end 




