require 'rails_helper'

RSpec.describe 'delete brewery brews' do
  it 'has a link to delete each brew on the brewery brew index page' do
    platt_park = Brewery.create!(name: "Platt Park Brewing", year_established: 2013, food_available: true)
    left_hand = Brewery.create!(name: "Left Hand Brewing", year_established: 2006, food_available: false)
    odell = Brewery.create!(name: "Odell Brewing", year_established: 2000, food_available: true)

    watermelon = platt_park.brews.create!(name: "Watermelon Sour", abv: 4.1, beer_type: "Sour", gluten_free: false, on_tap: true)
    madagascar = platt_park.brews.create!(name: "Madagascar Dream", abv: 6.7, beer_type: "Cream Ale", gluten_free: false, on_tap: true)
    astronaut = platt_park.brews.create!(name: "Astronaut Amber", abv: 5.1, beer_type: "Red Ale", gluten_free: false, on_tap: true)

    tiki = left_hand.brews.create!(name: "Gettin' Tiki With It Nitro", abv: 7.5, beer_type: "Wheat Ale", gluten_free: false, on_tap: false)
    flamingo = left_hand.brews.create!(name: "Flamingo Dreams Nitro", abv: 4.7, beer_type: "Blonde Ale", gluten_free: false, on_tap: true)
    cowboy = left_hand.brews.create!(name: "Galactic Cowboy Nitro", abv: 9.0, beer_type: "Imperial Stout", gluten_free: false, on_tap: true)

    sippin = odell.brews.create!(name: "Sippin' Pretty Fruited Sour", abv: 4.5, beer_type: "Sour", gluten_free: false, on_tap: true)
    peach = odell.brews.create!(name: "Peach Stand Rambler Blonde Ale", abv: 5.1, beer_type: "Blonde Ale", gluten_free: false, on_tap: true)

    visit "/breweries/#{odell.id}/brews"

    click_link "Delete Peach Stand Rambler Blonde Ale"

    expect(current_path).to eq('/brews')
    expect(page).to_not have_content("Peach Stand Rambler Blonde Ale")
    expect(page).to have_content("Sippin' Pretty Fruited Sour")

    click_link "Delete Sippin' Pretty Fruited Sour"

    expect(page).to_not have_content("Sippin' Pretty Fruited Sour")
  end
end
