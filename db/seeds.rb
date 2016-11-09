require 'random_data'

 50.times do
   Post.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
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

  puts "Seed finished"
  puts "#{Post.count} posts created"
  puts "#{Comment.count} comments created"
