#REQUIRE AND RUNN ALL YOUR CODE FROM HERE

require_relative "actorinfo/version"
require_relative "actorinfo/cli"
require_relative "actorinfo/actors_class"
require_relative "actorinfo/user"

Scraper.new.scrape
puts Actor.all 
 