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
     actor_name = actor.css('a').text.strip.downcase

      if actor_name == name
       return true
      end

     end
    @@all << self
  end

  def find_actor(name)
    if scrape == name
      return true
    end
  end

  def create_actor(person)
    #info_link = Nokogiri::HTML(open(person.css('a')[0]['href']))  # this will open and access a secondary link in the webpage containing further details.

    new_actor = Actor.new
    new_actor.name = person.css('a').text.strip.downcase
    new_actor.age = info_link.css('p')[4].css('b')[0].text
    new_actor.dob = info_link.css('p')[4].css('b')[1].text
    new_actor.place_of_b = info_link.css('p')[5].css('b').text
    new_actor
  end

  def self.all
    @@all
  end


end
