class User
 attr_accessor :user_name, :actor

  @@all = []

  def initialize(user_name, actor)
    @user_name = user_name
    @actor = actor
    @@all << self
  end

  def self.all
    @@all
  end

  def self.clear
    @@all.clear
  end

end
