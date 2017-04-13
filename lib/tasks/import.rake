task :import_csv, [:message] => :environment do |t, args|
  require 'csv'    

  path = args[:message]
  return unless path

  csv_text = File.read(path)
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    title = Title.create(name: row["Original Title"].try(:gsub, '"',''), category_id: 1)
    tweak = Tweak.create(name: row['Tweaqs'].try(:gsub, '"',''), title_id: title.id)
    description = Description
                    .create(
                      text: row['Description of New Film'].try(:gsub, '"',''),
                      creator: row['Creator'],
                      tweak_id: tweak.id
                    )
  end


end