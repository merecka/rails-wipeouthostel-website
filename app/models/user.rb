class User < ApplicationRecord
	has_many :reservations
	has_many :rooms, through: :reservations
	has_secure_password

end