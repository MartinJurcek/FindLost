class AddUserIdToStuffs < ActiveRecord::Migration[6.0]
  def change
    add_column :stuffs, :user_id, :int
  end
end
