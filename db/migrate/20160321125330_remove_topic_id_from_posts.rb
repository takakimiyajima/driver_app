class RemoveTopicIdFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :topic_id, :integer
  end
end
