# desc "Send daily wit stop email"
# task :send_wit_stop => :environment do
#   puts "finding description #{Date.today.beginning_of_day}"

#   description = Description
#                   .where('descriptions.created_at > ?', Date.today.beginning_of_day)
#                   .order(likes_count: :desc)
#                   .limit(1)
#                   .first

#   if description.present?
#     users = User.joins(:email_preferences).where(email_preferences: {wit_stop: true}).distinct

#     users.each do |user|
#       puts "sending to #{user.email}"
#       DailySummaryMailer.daily_summary_email(user, description).deliver_now
#     end

#   end
# end

desc "Send summary of upvotes"
task :send_upvote_summary => :environment do
  likes_by_description_id ||= Like.where("created_at > ?", 24.hours.ago).group(:description_id).count

  descriptions_by_user_id = Description.where(id: likes_by_description_id.keys).group_by(&:user_id)

  descriptions_by_user_id.each do |user_id, descriptions|
    description_like_count = []
    description_like_count << descriptions.map do |d|
                                {text: d.text, count: likes_by_description_id[d.id]}
                              end

    UpvoteMailer.upvote_summary(user_id, description_like_count)
  end
end