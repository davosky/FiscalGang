class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable

  belongs_to :location, optional: true
  has_many :isee_cards
  has_many :icric_pais
  has_many :dashboards
end
