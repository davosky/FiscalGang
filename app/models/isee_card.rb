class IseeCard < ApplicationRecord
  belongs_to :use_type, optional: true
  belongs_to :location, optional: true
  belongs_to :user, optional: true
end
