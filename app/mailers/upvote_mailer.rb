class UpvoteMailer < ApplicationMailer

  def upvoted(upvoter, description)
    @description = description

    @description_author = description.user

    return nil unless @description_author.email_preferences.upvote_notifications?

    @upvoter = upvoter
    mail(to: @description_author.email, subject: "#{@upvoter.username} gave you an upvote!")
  end

  #UpvoteMailer.upvoted(User.where(email: 'aneigher@gmail.com').last, Description.last).deliver_now
end
