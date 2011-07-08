namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    99.times do |n|
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
        pen_name_bio = Faker::Lorem.paragraph
        user.authors.create(:name => pen_name,
                            :bio => pen_name_bio)
      end
      editor_name = Faker::Name.name
      editor_bio = Faker::Lorem.paragraph
      user.create_editor(:name => editor_name,
                         :bio => editor_bio)
    end
  end
end
