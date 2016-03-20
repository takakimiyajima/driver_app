class CreateNegotiations < ActiveRecord::Migration
  def change
    create_table :negotiations do |t|
      t.string :title
      t.integer :nego_id
      t.integer :driver_post_id
      t.integer :driver_id
      t.integer :hiker_id

      t.timestamps
    end
  end
end
