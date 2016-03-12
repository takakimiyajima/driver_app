class CreateDriverPosts < ActiveRecord::Migration
  def change
    create_table :driver_posts do |t|
      t.string :origin
      t.string :destination
      t.date :departure_date

      t.timestamps
    end
  end
end
