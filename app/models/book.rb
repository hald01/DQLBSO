class Book < ApplicationRecord
  before_save { name.downcase! }

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :price, presence: true, numericality: { only_integer: true, less_than: 1000000 }
  validates :number, presence: true, numericality: { only_integer: true, less_than: 1000 }
end
