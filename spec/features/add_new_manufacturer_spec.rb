require 'rails_helper'

feature "add a new manufacturer to the database" do

  scenario "add a new correct manufactuer to the database" do
    visit new_manufacturer_path
    manufacturer = FactoryGirl.build(:manufacturer)

    fill_in "Name", with: manufacturer.name
    fill_in "Nation", with: manufacturer.nation
    click_on "Submit"

    expect(page).to have_content("Manufacturer successfully added")

  end

  scenario "try to add an incomplete manufacturer" do

  visit new_manufacturer_path
  manufacturer = FactoryGirl.build(:manufacturer)
  fill_in "Name", with: manufacturer.name

  click_on "Submit"

  expect(page).to have_content("Nation can't be blank")

  end


end

