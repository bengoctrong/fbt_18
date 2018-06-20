class Tour < ApplicationRecord
  VALID_PRICE = /\A\d+(?:\.\d{0,2})?\z/

  has_many :rates, dependent: :destroy
  has_many :users, through: :rates, source: :user
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews, source: :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings, source: :user
  has_many :category_tours, dependent: :destroy
  has_many :categories, through: :category_tours, source: :category

  validates :name, presence: true, length: {maximum: Settings.tour.name_max}
  validates :content, presence: true, length: {maximum: Settings.tour.content_max}
  validates :price, presence: true, format: {with: VALID_PRICE},
    numericality: {greater_than: Settings.tour.price_min, less_than: Settings.tour.price_max}
  validates :quantity, presence: true,
    numericality: {greater_than: Settings.tour.quantity_min, less_than: Settings.tour.quantity_max}
  validates :start_date, presence: true,
    date: {after_or_equal_to: proc{Time.zone.today}}, on: :create
  validates :end_date, presence: true
  validate :date_validation?

  mount_uploader :picture, PictureUploader

  def date_validation?
    return unless end_date < start_date
    errors.add(:end_date, "must be after the start date")
  end
end
