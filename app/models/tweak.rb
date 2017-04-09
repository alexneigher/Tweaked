class Tweak < ApplicationRecord
  belongs_to :title
  has_many :descriptions

  validates_uniqueness_of :name
end
