class User < ApplicationRecord
  attr_accessor :remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\+?\d{1,3}?[- .]?\(?(?:\d{2,3})\)?[- .]?\d\d\d[- .]?\d\d\d\d/

  enum role: %i(admin user banned)

  has_many :rates, dependent: :destroy
  has_many :tours, through: :rates, source: :tour
  has_many :reviews, dependent: :destroy
  has_many :tours, through: :reviews, source: :tour
  has_many :bookings, dependent: :destroy
  has_many :tours, through: :bookings, source: :tour

  validates :name, presence: true, length: {maximum: Settings.user.name_max}
  validates :email, presence: true, length: {maximum: Settings.user.email_max},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :address, presence: true, length: {maximum: Settings.user.address_max}
  validates :phone, presence: true, format: {with: VALID_PHONE_REGEX}
  validates :bank_number, presence: true, length: {maximum: Settings.user.bank_max},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.user.pass_min}, allow_nil: true

  before_save :downcase_email
  before_save :upcase_bank_number

  has_secure_password

  def downcase_email
    self.email = email.downcase
  end

  def upcase_bank_number
    self.bank_number = bank_number.upcase
  end

  def self.digest string
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def authenticated? attribute, token
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def remember
    self.remember_token = User.new_token
    update_attributes(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attributes remember_digest: nil
  end
end
