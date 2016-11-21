require 'random_data'

15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all

 50.times do
   Post.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     topic:  topics.sample
   )
 end

 posts = Post.all

 100.times do
   Comment.create!(
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

  post = Post.find_or_create_by!(
    title: "Laura's special post",
    body: "Inserting only if this doesn't already exist",
    )

  Comment.create!(post_id: post.id, body: "this is it")

  20.times do
    Advertisement.create!(
      title:  RandomData.random_sentence,
      body:  RandomData.random_paragraph,
      price:  RandomData.random_price
    )
  end

  puts "Seed finished"
  puts "#{Topic.count} topics created"
  puts "#{Post.count} posts created"
  puts "#{Comment.count} comments created"
  puts "#{Advertisement.count} ads created"
