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

  has_many :active_friendships, class_name:"Friendship", foreign_key: "follower_id", dependent: :destroy
  has_many :passtive_friendships, class_name: "Friendship", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :active_friendships, source: :followed
  has_many :followers, through: :passtive_friendships, source: :follower

  def follow(user)
    active_friendships.create(followed_id: user.id)
  end

  def unfollow(user)
    active_friendships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    following.include?(user)
  end

  def admin?
    self.role == "admin"
  end

end
