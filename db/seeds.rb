# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:"Example Seed",
            email:"example_seed@railstutorial.org",
            password:"foobar",
            password_confirmation:"foobar",
            admin: true,
            activated: true,
            activated_at:Time.zone.now
            )

99.times do |n|
   name = Faker::Name.name
   email = "example-#{n+1}@railstutorial.org"
   password = "password"
   User.create!(name:name,
                email:email,
                password:password,
                password_confirmation:password,
                activated: true,
                activated_at:Time.zone.now
                )
end

users = User.order(:created_at).take(6)
50.times do
  tip_content = Faker::Lorem.characters(50)
  users.each {|user| user.tips.create!(content: tip_content) }
end

users.each do |user| 
  user.tips.each do |tip| 
    2.times do
        content = Faker::Lorem.characters(50)
        tip.reasons.create!(content: content)
    end
  end
end

# リレーションシップ
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }