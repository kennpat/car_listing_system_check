class Vehicle < ActiveRecord::Base
  belongs_to :manufacturer
  validates :color, presence: true
  validates :year, presence: true
  validates :mileage, presence: true
  validates :manufacturer_id, presence: true
end
