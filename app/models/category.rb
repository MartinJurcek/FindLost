class Category < ApplicationRecord

  validates :category_name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }

end