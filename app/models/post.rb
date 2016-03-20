class Post < ActiveRecord::Base
    belongs_to :negotiation
    
    validates_presence_of :contributor
    validates_presence_of :content
    validates :user_id, presence: true
end
