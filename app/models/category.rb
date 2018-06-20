class Category < ApplicationRecord
  has_many :category_tours
  has_many :tours, through: :category_tours, source: :tour
end
