class Category < ApplicationRecord
  has_many :titles, dependent: :destroy
end
