namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    100.times do |n|
      name = Faker::Name.name
      email = "example.user#{n}@example.com"
      provider = "twitter"
      uid = "example.user#{n}"
      user = User.create!(:name => name,
                   :email => email,
                   :provider => provider,
                   :uid => uid)
      10.times do |a|
        pen_name = Faker::Name.name
        pen_name_bio = Faker::Lorem.sentences(2).join(" ")
        author = user.authors.create!(:name => pen_name,
                                      :bio => pen_name_bio)
        10.times do |w|
          work_name = Faker::Lorem.sentence
          work_content = Faker::Lorem.paragraphs(5).join("\n")
          author.works.create!(:name => work_name,
                               :content => work_content)

        end
      end
      editor_name = Faker::Name.name
      editor_bio = Faker::Lorem.sentences(2).join(" ")
      user.create_editor(:name => editor_name,
                         :bio => editor_bio)
    end
  end
end
