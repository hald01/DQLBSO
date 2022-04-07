class User < ApplicationRecord
  before_save { email.downcase! }

  validates :name, presence: true, length: { maximum: 20 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 },format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
  end

  validates :age, presence: true, length: { maximum: 3 }, allow_nil: true

  validates :address, presence: true, length: { maximum: 100 }, allow_nil: true

  validates :phone, presence: true, length: { maximum: 12, minimum: 6 }, allow_nil: true
  
end

