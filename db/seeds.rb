require 'random_data'

5.times do
   User.create!(
     name:     RandomData.random_name,
     email:    RandomData.random_email,
     password: RandomData.random_sentence
     )
 end
 users = User.all


15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all

 50.times do
   post = Post.create!(
     user:   users.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     topic:  topics.sample
   )
    post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
    rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
 end
 posts = Post.all

 20.times do
   SponsoredPost.create!(
   topic: topics.sample,
   title: "This is a sponsored post",
   body:  RandomData.random_paragraph,
   price:  RandomData.random_price
 )
 end

 sponsored_posts = SponsoredPost.all

 100.times do
   Comment.create!(
     user: users.sample,
     post: posts.sample,
     sponsored_post: sponsored_posts.sample,
     body: RandomData.random_paragraph
   )
 end

  20.times do
    Advertisement.create!(
      title:  RandomData.random_sentence,
      body:  RandomData.random_paragraph,
      price:  RandomData.random_price
    )
  end

  admin = User.create!(
     name:     'Admin User',
     email:    'admin@example.com',
     password: 'helloworld',
     role:     'admin'
  )

  moderator = User.create!(
    name:     'Moderator User',
    email:    'moderator@example.com',
    password: 'helloworld',
    role:     'moderator'
  )

  member = User.create!(
     name:     'Member User',
     email:    'member@example.com',
     password: 'helloworld'
  )

  puts "Seed finished"
  puts "#{User.count} users created"
  puts "#{Topic.count} topics created"
  puts "#{Post.count} posts created"
  puts "#{SponsoredPost.count} sponsored posts created"
  puts "#{Comment.count} comments created"
  puts "#{Advertisement.count} ads created"
  puts "#{Vote.count} votes created"
