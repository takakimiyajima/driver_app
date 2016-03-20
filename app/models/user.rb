class User < ActiveRecord::Base
  has_many :driver_posts, dependent: :destroy
  has_many :negotiations_of_driver, :class_name => 'Negotiation', :foreign_key => 'driver_id'
  has_many :negotiations_of_hiker, :class_name => 'Negotiation', :foreign_key => 'hiker_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         validates :name,  presence: true, length: { maximum: 20 }
         

  
end
