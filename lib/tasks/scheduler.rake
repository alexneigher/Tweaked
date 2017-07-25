desc "Send daily wit stop email"
task :send_wit_stop => :environment do
  puts "finding description #{Date.today.beginning_of_day}"

  description = Description
                  .where('descriptions.created_at > ?', Date.today.beginning_of_day)
                  .order(upvotes: :desc)
                  .limit(1)
                  .first

  if description.present?
    users = User.joins(:email_preferences).where(email_preferences: {wit_stop: true}).distinct

    users.each do |user|
      puts "sending to #{user.email}"
      DailySummaryMailer.daily_summary_email(user, description).deliver_now
    end

  end
end
