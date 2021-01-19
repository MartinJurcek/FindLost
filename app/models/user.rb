class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :stuffs, dependent: :destroy
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false }, 
                       length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, 
                    uniqueness: { case_sensitive: false }, 
                    length: {  maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable


  validates :phone_number, :presence => true,
                           :numericality => true


  def full_name
    return "#{username}" if username
    #"Anonymus" 
  end
end
