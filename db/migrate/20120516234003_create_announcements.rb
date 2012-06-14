class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :header
      t.text :body

      t.timestamps
    end
  end
end
