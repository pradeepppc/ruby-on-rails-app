class User < ApplicationRecord
	has_secure_password
	has_many :userans,dependent: :destroy
	has_many :scores,dependent: :destroy
end
