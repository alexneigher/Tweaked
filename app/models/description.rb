class Description < ApplicationRecord
  belongs_to :tweak
  
  validates_presence_of :text


  def upvote!
    self.upvotes += 1
    self.save
  end

  def downvote!
    self.downvotes += 1
    self.save
  end
  
end
