class User < ActiveRecord::Base
  has_many :driver_posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         validates :name,  presence: true, length: { maximum: 20 }
         

  
end
