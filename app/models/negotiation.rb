class Negotiation < ActiveRecord::Base
    has_many :posts
    belongs_to :driver, :class_name => 'User'
    belongs_to :hiker, :class_name => 'User'
    
    default_scope -> { order('created_at DESC') }
    validates :driver_id, presence: true
    validates :hiker_id, presence: true
end
