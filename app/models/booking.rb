class Booking < ApplicationRecord
  enum status: %i(pending canceled accepted rejected)

  belongs_to :user
  belongs_to :tour

  scope :order_desc, ->{order created_at: :desc}
  scope :pending_status, ->{where(status: :pending).order_desc}
end
