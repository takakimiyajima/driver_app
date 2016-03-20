class AddNegotiationIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :negotiation_id, :integer
  end
end
