class RemoveContributorFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :contributor, :text
  end
end
