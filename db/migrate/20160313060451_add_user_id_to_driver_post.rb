class AddUserIdToDriverPost < ActiveRecord::Migration
  def change
    add_column :driver_posts, :user_id, :integer
  end
end
