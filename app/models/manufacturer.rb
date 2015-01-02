class Manufacturer < ActiveRecord::Base
  validates :name, presence: true
  validates :nation, presence: true
end
