class Subgenere < ApplicationRecord
  belongs_to :genere
  has_many :scores, dependent: :destroy
  has_many :questions ,dependent: :destroy
end
