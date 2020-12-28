class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :found_stuf, -> { where(find: true) }
  scope :lost_stuf, -> { where(find: false) } 
 
end
