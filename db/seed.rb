require 'faker'

User.delete_all
Post.delete_all

10.times do 
  user = User.create name: Faker::Name.name
  
  10.times do 
    Post.create title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user: user
  end
end


