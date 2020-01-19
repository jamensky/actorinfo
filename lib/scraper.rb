require 'nokogiri'
require 'open-uri'
#require 'pry'


class Scraper 
  
  def scraped_actors
    doc = Nokogiri::HTML(open("https://www.empireonline.com/movies/features/best-movies-2/"))
    
    
  end 
  
end 

 
x = Scraper.new
puts x.scraped_actors

