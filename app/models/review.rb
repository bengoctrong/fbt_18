class Review < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  validates :content, presence: true
end
