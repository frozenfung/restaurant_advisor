class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :restaurant, optional: true

end
