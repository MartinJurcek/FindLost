class StuffCategory < ApplicationRecord
  belongs_to :stuff
  belongs_to :category
end