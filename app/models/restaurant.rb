class Restaurant < ApplicationRecord
  belongs_to :category, optional: true
end
