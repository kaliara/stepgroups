class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :title
      t.integer :district_id
      t.string :address_building
      t.string :address_street1
      t.string :address_street2
      t.string :address_city
      t.string :address_state
      t.string :address_zip_code
      t.string :address_notes
      t.integer :wday
      t.integer :hour
      t.integer :minute
      t.string :topic
      t.string :contact

      t.timestamps
    end
  end
end
