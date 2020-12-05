class Category < ApplicationRecord

  has_many :stuff_categories
  has_many :stuffs, through: :stuff_categories
  validates :category_name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }

end