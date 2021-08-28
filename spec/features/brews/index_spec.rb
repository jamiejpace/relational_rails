require 'rails_helper'

RSpec.describe 'Brew index' do
  before :each do
    @platt_park = Brewery.create!(name: "Platt Park Brewing", year_established: 2013, food_available: true)
    @left_hand = Brewery.create!(name: "Left Hand Brewing", year_established: 2006, food_available: false)
    @odell = Brewery.create!(name: "Odell Brewing", year_established: 2000, food_available: true)

    @watermelon = @platt_park.brews.create!(name: "Watermelon Sour", abv: 4.1, beer_type: "Sour", gluten_free: false, on_tap: true)
    @madagascar = @platt_park.brews.create!(name: "Madagascar Dream", abv: 6.7, beer_type: "Cream Ale", gluten_free: false, on_tap: true)
    @astronaut = @platt_park.brews.create!(name: "Astronaut Amber", abv: 5.1, beer_type: "Red Ale", gluten_free: false, on_tap: true)

    @tiki = @left_hand.brews.create!(name: "Gettin' Tiki With It Nitro", abv: 7.5, beer_type: "Wheat Ale", gluten_free: false, on_tap: false)
    @flamingo = @left_hand.brews.create!(name: "Flamingo Dreams Nitro", abv: 4.7, beer_type: "Blonde Ale", gluten_free: false, on_tap: true)
    @cowboy = @left_hand.brews.create!(name: "Galactic Cowboy Nitro", abv: 9.0, beer_type: "Imperial Stout", gluten_free: false, on_tap: true)

    @sippin = @odell.brews.create!(name: "Sippin' Pretty Fruited Sour", abv: 4.5, beer_type: "Sour", gluten_free: false, on_tap: true)
    @peach = @odell.brews.create!(name: "Peach Stand Rambler Blonde Ale", abv: 5.1, beer_type: "Blonde Ale", gluten_free: false, on_tap: true)
    @drumroll = @odell.brews.create!(name: "Drumroll", abv: 5.3, beer_type: "Pale Ale", gluten_free: false, on_tap: false)
  end
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  it 'displays all of the names of the brews and their attributes' do
    visit '/brews'
    save_and_open_page

    expect(page).to have_content(@watermelon.name)
    expect(page).to have_content(@flamingo.abv)
    expect(page).to have_content(@peach.on_tap)
  end

#   User Story 8, Child Index Link
#
# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Child Index
  it 'displays a link at the top of each page that takes user to the brews index' do
    visit '/breweries'
    save_and_open_page

    expect(page).to have_link("Brews Index", )
  end

  xit 'has brews link that takes user to brews index page' do
    visit '/breweries'

    click_link('Brews Index')

    expect(current_path).to eq('/brews')
  end
end
