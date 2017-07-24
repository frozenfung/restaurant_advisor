class Restaurant < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user
  has_many :comments
end
