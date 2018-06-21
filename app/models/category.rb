class Category < ApplicationRecord
  has_many :categorytours
  has_many :tours, through: :categorytours, source: :tour
end
