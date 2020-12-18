class AddAddressLatitudeAndLongitudeForStuff < ActiveRecord::Migration[6.0]
  def change
    add_column :stuffs, :address, :string
    add_column :stuffs, :latitude, :decimal
    add_column :stuffs, :longitude, :decimal
  end
end
