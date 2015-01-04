require "rails_helper"

feature "inventory manager wishes to add a new vehicle to the lot" do
  scenario "add a correct vehicle to the database" do
    man = FactoryGirl.build(:manufacturer)
    man.save
    man2 = FactoryGirl.build(:manufacturer)
    man2.save

    visit new_vehicle_path

    new_car = FactoryGirl.build(:vehicle)
    fill_in "Color", with: new_car.color
    fill_in "Year", with: new_car.year
    fill_in "Mileage", with: new_car.mileage

    select("Ford3", from: "Manufacturer")
    click_on "Submit"

    expect(page).to have_content("Vehicle successfully added")

  end

  scenario "try to add a vehicle missing information" do
    man = FactoryGirl.build(:manufacturer)
    man.save
    man2 = FactoryGirl.build(:manufacturer)
    man2.save
    visit new_vehicle_path
    new_car = FactoryGirl.build(:vehicle)

    click_on "Submit"
    expect(page).to have_content("Color can't be blank")
    expect(page).to have_content("Year can't be blank")
    expect(page).to have_content("Mileage can't be blank")
  end
end
