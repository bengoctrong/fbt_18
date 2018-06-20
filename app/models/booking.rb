class Booking < ApplicationRecord
  enum status: %i(pending canceled accepted rejected)

  belongs_to :user
  belongs_to :tour
end
