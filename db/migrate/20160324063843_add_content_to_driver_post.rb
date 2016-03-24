class AddContentToDriverPost < ActiveRecord::Migration
  def change
    add_column :driver_posts, :content, :string
  end
end
