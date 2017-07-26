class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :restaurant, :counter_cache => true

end
