class CreateStuffs < ActiveRecord::Migration[6.0]
  def change
    create_table :stuffs do |t|
      t.string :title
      t.text :description
      t.date :found_date

      t.timestamps
    end
  end
end
