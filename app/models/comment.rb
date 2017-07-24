class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :restaurants, optional: true

end
