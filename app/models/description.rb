class Description < ApplicationRecord
  belongs_to :tweak
  belongs_to :user
  has_many :likes
  validates_presence_of :text


  def upvote!(current_user)
    self.likes.create(user: current_user)
    update(likes_count: self.likes_count + 1)
    UpvoteMailer.upvoted(current_user, self).deliver_now
  end

  def liked_by?(user)
    return false unless user
    likes.pluck(:user_id).include?(user.id)
  end

end
