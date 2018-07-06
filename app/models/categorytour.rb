class Categorytour < ApplicationRecord
  belongs_to :category
  belongs_to :tour
end
