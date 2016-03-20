class RemovePostNumberFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :post_number, :integer
  end
end
