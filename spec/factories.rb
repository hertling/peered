Factory.define :user do |user|
  user.provider "twitter"
  user.email    "bob@example.com"
  user.name     "Bob Robertson"
  user.uid      "bob"
end

Factory.define :author do |author|
  author.name "Will Hertling"
  author.bio  "Mad Scientist"
  author.user {|a| a.association(:user)}
end

Factory.define :work do |work|
  work.name    "Magnum Opus"
  work.content "It was a dark and stormy night..."
end
