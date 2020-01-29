#REQUIRE AND RUNN ALL YOUR CODE FROM HERE
require_relative "actorinfo/cli"
require_relative "actorinfo/scraper"
require_relative "actorinfo/actors_class"
require_relative "actorinfo/user"
require_relative "actorinfo/version"


#Scraper.new.scrape("chris pine")
#puts Actor.actor_info("chris pine", 2)
Cli.new
