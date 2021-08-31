require 'rails_helper'

RSpec.describe 'brews edit' do
  it 'links to edit page from show page' do
      platt_park = Brewery.create!(name: "Platt Park Brewing", year_established: 2013, food_available: true)
      astronaut = platt_park.brews.create!(name: "Astronaut Amber", abv: 5.1, beer_type: "Red Ale", gluten_free: false, on_tap: true)
      visit "/brews/#{astronaut.id}"

      click_link "Update Brew"

      expect(current_path).to eq("/brews/#{astronaut.id}/edit")
  end

  it 'can edit the brew' do
    platt_park = Brewery.create!(name: "Platt Park Brewing", year_established: 2013, food_available: true)
    astronaut = platt_park.brews.create!(name: "Astronot Amber", abv: 5.1, beer_type: "Red Ale", gluten_free: false, on_tap: true)

    visit "/brews/#{astronaut.id}"

    expect(page).to have_content("Astronot Amber")

    click_link "Update Brew"

    fill_in 'Name', with: "Astronaut Amber"
    fill_in 'Abv', with: 6.2
    fill_in 'Beer type', with: "Amber"
    fill_in 'Gluten free', with: false
    fill_in 'On tap', with: true

    click_button "Update Brew"

    expect(current_path).to eq("/brews/#{astronaut.id}")
    expect(page).to have_content("Astronaut Amber")
  end
end
