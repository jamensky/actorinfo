require 'nokogiri'
require 'open-uri'
require 'pry'

=begin
class Scraper 
  
  def scraped_actors
        binding.pry

    doc = Nokogiri::HTML(open("https://www.empireonline.com/movies/features/best-movies-2/"))
  end 
  
end 

=end 


a = 1 
b = 2 

if a < b 
  puts 'yes'
else 
  puts 'no'
  binding.pry
end 

