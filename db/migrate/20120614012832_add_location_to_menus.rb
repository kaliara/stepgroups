class AddLocationToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :location, :integer, :default => 0
  end
end
