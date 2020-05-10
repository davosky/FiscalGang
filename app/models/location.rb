# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :isee_cards
  has_many :users
end
