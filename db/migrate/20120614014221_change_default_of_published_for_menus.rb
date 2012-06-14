class ChangeDefaultOfPublishedForMenus < ActiveRecord::Migration
  def up
    change_column_default :menus, :published, true
  end

  def down
    change_column_default :menus, :published, false
  end
end