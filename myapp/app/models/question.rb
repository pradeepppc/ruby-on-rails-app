class Question < ApplicationRecord
  belongs_to :subgenere
  has_many :userans, dependent: :destroy
end
