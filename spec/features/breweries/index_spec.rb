require 'rails_helper'

RSpec.describe 'Brewery index' do
  before :each do
    @platt_park = Brewery.create!(name: "Platt Park Brewing", year_established: 2013, food_available: true)
    @left_hand = Brewery.create!(name: "Left Hand Brewing", year_established: 2006, food_available: false)
    @odell = Brewery.create!(name: "Odell Brewing", year_established: 2000, food_available: true)
  end
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  it 'shows all of the names of the breweries' do
    visit '/breweries'

    expect(page).to have_content(@platt_park.name)
    expect(page).to have_content(@left_hand.name)
    expect(page).to have_content(@odell.name)
  end
end
