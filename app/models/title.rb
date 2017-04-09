class Title < ApplicationRecord

  has_many :tweaks

  validates_presence_of :name
  validates_uniqueness_of :name

end
