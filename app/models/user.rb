class User < ActiveRecord::Base
  attr_accessor :name, :email
  has_many :movies 
  has_many :reviews, dependent: :destroy    
  validates :name,  presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
end
