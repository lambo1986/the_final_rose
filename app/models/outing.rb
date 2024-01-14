class Outing < ApplicationRecord
  belongs_to :contestant
  has_many :outing_contestants
  has_many :contestants, through: :outing_contestants
end
