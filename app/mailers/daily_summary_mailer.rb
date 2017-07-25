class DailySummaryMailer < ApplicationMailer

  def daily_summary_email(user, title, tweak, description, created_at, author, upvote_count)
    @title = title
    @tweak = tweak
    @description = description
    @created_at = created_at
    @author = author
    @upvote_count = upvote_count
    @user = user
    mail(to: @user.email, subject: "LETTERLOOSE Daily Wit-Stop: #{Date.current.strftime('%b %d, %Y')}")
  end

  #DailySummaryMailer.daily_summary_email(User.where(email: 'aneigher@gmail.com').last, "Tally Ho", "Tally Hoe", "Keeping track", Date.new(2017,2,2),"Rick", 10).deliver_now
end
