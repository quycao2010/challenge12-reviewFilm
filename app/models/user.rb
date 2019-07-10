class User < ActiveRecord::Base
  has_many :movies 
  has_many :reviews, dependent: :destroy    
  validates :name,  presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_secure_password
end
