class Location < ApplicationRecord
  has_many :isee_cards
  has_many :icric_pais
  has_many :users
end
