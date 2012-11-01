class Menu < ActiveRecord::Base
  LOCATIONS = [["Top - MAIN", 0], ["Side - GET STARTED", 1], ["Side - CODA RECOVERY", 2], ["Side - GET INVOLVED", 3]]
  
  def self.get_items(location)
    Menu.where("published = ? AND location = ?", true, location)
  end
end
