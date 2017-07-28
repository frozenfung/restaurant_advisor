class Restaurant < ApplicationRecord
  belongs_to :category, optional: true

  belongs_to :user, :optional => true
  has_many :favorites, :dependent => :destroy
  has_many :favorited_users, :through => :favorites, :source => :user
  has_many :comments, ->{ order("id DESC")}
  has_one :location # 單數

  def find_my_favorite(user)
    if user
      self.favorites.where( :user_id => user.id ).first
    else
      nil
    end
  end

  def is_favorited_by(user)
    find_favorite(user).present?
  end

end
