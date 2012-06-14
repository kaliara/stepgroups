class Menu < ActiveRecord::Base
  LOCATIONS = [["Side Top", 0], ["Side Bottom", 1], ["Footer", 2]]
  
  def self.get_items(location)
    Menu.where("published = ? AND location = ?", true, location)
  end
end
