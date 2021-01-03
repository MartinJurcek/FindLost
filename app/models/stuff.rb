class Stuff < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :stuff_categories
  has_many :categories, through: :stuff_categories
  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: {maximum: 300}
  validate :image_type
  after_commit :add_default_image, on: %i[create update]
  attr_accessor :found_date

  #search with word
  def self.search(search)
    stuff = all
    stuff = Stuff.where('title LIKE ?', "%#{search}%")
    return stuff
  end

  #search location
  def self.searchLoc(search)
    stuff = all
    stuff = Stuff.where('address LIKE ?', "%#{search}%")
    return stuff
  end

  #search found
  def self.found(stuff)
    stuff = all
    stuff = Stuff.where(find: true)
    return stuff
  end
  
  #search lost
  def self.lost(stuff)
    stuff = all
    stuff = Stuff.where(find: false)
    return stuff
  end

  def self.cat(cat)
    stuff = all
    stuff = Stuff.joins(:categories).where('categories.id LIKE ?', "%#{cat}%")
    return stuff
  end

  def self.between(start_date, end_date)
    stuff = all
    stuff = Stuff.where('found_date >= ? AND found_date <= ?', start_date, end_date)
    return stuff
  end

  def stuff_image
    if image.attached?
      image.variant(resize: "150x150!").processed 
    else
      "/image-not-found.png"
    end
  end

  private

  def image_type
    if image.attached? == false
      add_default_image
    elsif
      !image.content_type.in?(%('image/jpeg image/png')) 
      errors.add(:image, 'needs to be a JPEG or PNG')
    end
  end

  def add_default_image
    unless image.attached?
      image.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'image-not-found.png'
          )
        ),
        filename: 'image-not-found.png',
        content_type: 'image/png'
      )
    end
  end
end
