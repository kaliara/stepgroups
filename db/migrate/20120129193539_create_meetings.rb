class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :title
      t.integer :meeting_address_id
      t.integer :wday
      t.integer :hour
      t.integer :minute
      t.string :topic
      t.string :contact

      t.timestamps
    end
  end
end
