class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :label
      t.string :path, :default => "/"
      t.boolean :published, :default => 0

      t.timestamps
    end
  end
end
