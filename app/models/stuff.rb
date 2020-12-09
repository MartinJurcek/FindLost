class Stuff < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :stuff_categories
  has_many :categories, through: :stuff_categories
  validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true, length: {maximum: 300}
  validate :image_type
  after_commit :add_default_image, on: %i[create update]

  
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else 
      Stuff.all
    end
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
