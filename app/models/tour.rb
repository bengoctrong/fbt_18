class Tour < ApplicationRecord
  VALID_PRICE = /\A\d+(?:\.\d{0,2})?\z/

  has_many :rates, dependent: :destroy
  has_many :users, through: :rates, source: :user
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews, source: :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings, source: :user
  has_many :categorytours, dependent: :destroy
  has_many :categories, through: :categorytours, source: :category

  validates :name, presence: true, length: {maximum: Settings.tour.name_max}
  validates :description, presence: true, length: {maximum: Settings.tour.content_max}
  validates :price, presence: true, format: {with: VALID_PRICE},
    numericality: {greater_than: Settings.tour.price_min, less_than: Settings.tour.price_max}
  validates :quantity, presence: true,
    numericality: {greater_than: Settings.tour.quantity_min, less_than: Settings.tour.quantity_max}
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :date_validation?
  scope :order_desc, ->{order created_at: :desc}
  scope :search_by_name, ->(search){where("name LIKE ?", "%#{search}%") if search.present? }

  mount_uploader :picture, PictureUploader

  def date_validation?
    if start_date < Time.zone.today
      errors.add(:start_date, "must be after the start date")
      false
    elsif end_date < start_date
      errors.add(:end_date, "must be after the start date")
      false
    else
      true
    end
  end
end
