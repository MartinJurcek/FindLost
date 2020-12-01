class Stuff < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: {maximum: 200}

end