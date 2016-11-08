require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }
  let(:answer) {Answer.create!(body: 'Answer Body')}

   describe "attributes" do
     it "has a body attribute" do
       expect(answer).to have_attributes(body: "Answer Body")
     end
   end
 end
