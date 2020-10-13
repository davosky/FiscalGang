class IcricPai < ApplicationRecord
  belongs_to :use_type
  belongs_to :location
  belongs_to :user
end
