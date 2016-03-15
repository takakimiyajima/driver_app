class DriverPost < ActiveRecord::Base
    belongs_to :user
    default_scope -> { order('created_at DESC') }
    validates :origin, presence: true, length: { maximum: 30 }
    validates :destination, presence: true, length: { maximum: 30 }
    validates :departure_date, presence: true, length: { maximum: 30 }
    validates :user_id, presence: true
    
  def feed
      DriverPost.where("user_id = ?", id)
    
  end
end
