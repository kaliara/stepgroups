class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :name
      t.text :description
      t.boolean :allow_new_posts, :default => true
      t.boolean :visible, :default => true
      t.string :instructions

      t.timestamps
    end
  end
end
