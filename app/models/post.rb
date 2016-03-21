class Post < ActiveRecord::Base
    belongs_to :negotiation
    
    validates :content, presence: true
    validates :user_id, presence: true
    validates :negotiation_id, presence: true
end
