require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }
  let(:question) {Question.create!(title: 'Question Title', body: 'Question Body', resolved: false )}

   describe "attributes" do
     it "has title, body and resolved attributes" do
      expect(question).to have_attributes(title: 'Question Title', body: 'Question Body', resolved: false)
     end
   end
end
