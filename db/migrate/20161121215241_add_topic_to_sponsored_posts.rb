class AddTopicToSponsoredPosts < ActiveRecord::Migration
  def change
    add_index :sponsored_posts, :topic_id
  end
end
