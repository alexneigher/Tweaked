class Tweak < ApplicationRecord
  belongs_to :title
  has_many :descriptions
end
