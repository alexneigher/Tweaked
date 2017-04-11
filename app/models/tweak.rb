class Tweak < ApplicationRecord
  belongs_to :title
  has_many :descriptions, dependent: :destroy

  validates_uniqueness_of :name
end
