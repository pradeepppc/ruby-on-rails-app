class Genere < ApplicationRecord
	has_many :subgeneres,dependent: :destroy
end
