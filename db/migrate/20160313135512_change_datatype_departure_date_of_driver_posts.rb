class ChangeDatatypeDepartureDateOfDriverPosts < ActiveRecord::Migration
  def change
    change_column :driver_posts, :departure_date, :string
  end
end
