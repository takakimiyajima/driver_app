class Post < ActiveRecord::Base
    belongs_to :topic
    
    validates_presence_of :contributor
    validates_presence_of :content
end
