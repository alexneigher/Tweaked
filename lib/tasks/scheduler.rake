desc "Send daily wit stop email"
task :send_wit_stop => :environment do
  puts "finding description #{Date.today.beginning_of_day}"

  description = Description
                  .where('descriptions.created_at > ?', Date.today.beginning_of_day)
                  .order(upvotes: :desc)
                  .limit(1)
                  .first

  if description.present?
    emails = User.pluck(:email)

    tweak = description.tweak.name

    title = description.tweak.title.name
    
    upvotes = description.upvotes

    emails.each do |email|
      puts "sending to #{email}"
      DailySummaryMailer.daily_summary_email(email, title, tweak, description.text, user.username, upvotes).deliver_now
    end
  end
end
