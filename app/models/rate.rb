class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  validates :stars, presence: true,
    numericality: {greater_than: Settings.rate.star_min, less_than: Settings.rate.star_max}
end
