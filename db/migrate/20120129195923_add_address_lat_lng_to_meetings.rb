class AddAddressLatLngToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :address_lat, :string
    add_column :meetings, :address_lng, :string
  end
end
