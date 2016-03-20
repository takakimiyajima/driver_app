class RemoveNegoIdFromNegotiation < ActiveRecord::Migration
  def change
    remove_column :negotiations, :nego_id, :integer
  end
end
