class Car < ApplicationRecord
  belongs_to :user
  validates :model, presence: true
  validates :price, presence: true
  validates :city, presence: true
  validates :year, presence: true
end
