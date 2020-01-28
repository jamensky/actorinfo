require_relative 'actors_class'
require 'nokogiri'
require 'open-uri'
require 'pry'


class Scraper

  #attr_accessor :name, :age #, :date_of_birth, :movies, :oscar

  @@all = []
  @@doc = Nokogiri::HTML(open('https://www.listal.com/list/american-actors-under-40')).css('.pure-u-1')

  def scrape(name)

     @@doc.each do |actor|

      if actor.css('a').text.strip.downcase == name
        create_actor(actor)
        break
      end

     end
    @@all << self
  end

  def create_actor(actor)
    info_link = Nokogiri::HTML(open(actor.css('a')[0]['href']))  # this will open and access a secondary link in the webpage containing further details.

    new_actor = Actor.new
    new_actor.name = actor.css('a').text.strip.downcase
    new_actor.age = info_link.css('p')[4].css('b')[0].text
    new_actor.dob = info_link.css('p')[4].css('b')[1].text
    new_actor.place_of_b = info_link.css('p')[5].css('b').text
    new_actor
    #binding.pry
  end

  def self.all
    @@all
  end


end
