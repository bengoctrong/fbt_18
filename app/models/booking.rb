class Booking < ApplicationRecord
  enum status: %i(pending canceled accepted rejected)

  belongs_to :user
  belongs_to :tour

  validates :user_id, uniqueness: {scope: :tour_id}
  scope :order_desc, ->{order created_at: :desc}
  scope :from_status, ->(status){where status: status}
  scope :order_pending, ->{order :status}
  scope :profile_id, ->(id){where(user_id: id).order_desc}

  delegate :name, to: :tour, prefix: true
  delegate :picture, to: :tour, prefix: true

  def email_to_user
    BookingMailer.request_user(self).deliver_now
  end
end
