class Dashboard < ApplicationRecord
  belongs_to :user
  belongs_to :message_priority
end
