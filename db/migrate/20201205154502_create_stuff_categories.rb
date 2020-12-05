class CreateStuffCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :stuff_categories do |t|
      t.integer :stuff_id
      t.integer :category_id
    end
  end
end
