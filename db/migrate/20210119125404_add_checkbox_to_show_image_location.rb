class AddCheckboxToShowImageLocation < ActiveRecord::Migration[6.0]
  def change
    add_column :stuffs, :image_location, :boolean
  end
end
