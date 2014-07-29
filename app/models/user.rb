class User < ActiveRecord::Base
	validates :fullname, presence: true
	validates :email, presence: true
	
	has_secure_password

	has_many :posts
end