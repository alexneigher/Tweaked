class DailySummaryMailer < ApplicationMailer

  def daily_summary_email(user, title, tweak, description, author, upvote_count)
    @title = title
    @tweak = tweak
    @description = description
    @author = @author
    @upvote_count = upvote_count
    @user = user
    mail(to: 'aneigher@gmail.com', subject: "LETTERLOOSE Daily Wit-Stop: #{Date.current.strftime('%b %d, %Y')}")
  end
  #DailySummaryMailer.daily_summary_email(User.last, "Tally Ho", "Tally Hoe", "Keeping track", "Rick", 10).deliver_now

end
