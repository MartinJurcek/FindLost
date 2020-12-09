class AddFindLostSearchOption < ActiveRecord::Migration[6.0]
  def change
    add_column :stuffs, :find, :boolean
    add_column :stuffs, :lost, :boolean
  end
end
