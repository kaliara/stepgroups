class CreateMeetingAddresses < ActiveRecord::Migration
  def change
    create_table :meeting_addresses do |t|
      t.integer :district_id
      t.string :building
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :notes
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end
end
