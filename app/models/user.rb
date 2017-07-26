class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :restaurants, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, :through => :favorites, :source => :restaurant
  has_many :comments

  mount_uploader :file_location, PhotoImageUploader 


  def admin?
    self.role == "admin"
  end
end
