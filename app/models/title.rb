class Title < ApplicationRecord

  has_many :tweaks, dependent: :destroy
  belongs_to :category
  
  validates_presence_of :name
  validates_uniqueness_of :name

end
