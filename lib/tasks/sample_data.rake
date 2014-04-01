namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
  end
  
  task categorize: :environment do
    make_categories
  end
  
  task first_category: :environment do
    Category.create!(title: 'root_category', text: 'This is the default category!', user_id: 1)
  end
  
end

def make_users
  admin = User.create!(name:     "sergey malyshev",
                       email:    "malsn@rambler.ru",
                       password: "120581",
                       password_confirmation: "120581")
  admin.toggle!(:admin)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_categories
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
	text_content = Faker::Lorem.sentence(7)
    users.each { |user| user.categories.create!(title: content, text: text_content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end