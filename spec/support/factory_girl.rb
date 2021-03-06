require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :manufacturer do
    sequence(:name) {|n| "Ford#{n}" }
    nation "United States"
  end

  factory :vehicle do

    sequence(:mileage) {|n| 10000 + n }
    color "blue"
    year 2014
    manufacturer = "Ford"
  end
end
