class Menu < ActiveRecord::Base
  LOCATIONS = [["Top - MAIN", 0], ["Side - GET STARTED", 1], ["Side - WORK THE PROGRAM", 2], ["Side - RESOURCES", 3]]
  
  def self.get_items(location)
    Menu.where("published = ? AND location = ?", true, location)
  end
end
