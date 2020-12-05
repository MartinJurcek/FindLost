class Stuff < ApplicationRecord
  belongs_to :user
  has_many :stuff_categories
  has_many :categories, through: :stuff_categories
  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: {maximum: 200}

end
