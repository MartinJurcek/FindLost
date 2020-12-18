class AddAddressLatitudeAndLongitudeForStuff < ActiveRecord::Migration[6.0]
  def change
    add_column :stuffs, :address, :string
    add_column :stuffs, :latitude, :decimal, :precision => 10, :scale => 6
    add_column :stuffs, :longitude, :decimal, :precision => 10, :scale => 6
  end
end
