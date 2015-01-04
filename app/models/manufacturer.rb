class Manufacturer < ActiveRecord::Base
  validates :name, presence: true
  validates :nation, presence: true
  has_many :vehicles
end
