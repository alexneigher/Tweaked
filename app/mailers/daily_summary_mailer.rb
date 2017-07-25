class DailySummaryMailer < ApplicationMailer

  def daily_summary_email(user, description)
    @description = description
    @user = user
    mail(to: @user.email, subject: "LETTERLOOSE Daily Wit-Stop: #{Date.current.strftime('%b %d, %Y')}")
  end

  #DailySummaryMailer.daily_summary_email(User.where(email: 'aneigher@gmail.com').last, Description.last).deliver_now
end
