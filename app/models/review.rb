class Review < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  validates :content, presence: true
  scope :order_desc, ->{order created_at: :desc}
  scope :review_by_tour, ->(id){where tour_id: id}
end
