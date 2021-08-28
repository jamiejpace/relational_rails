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
    save_and_open_page

    expect(page).to have_content(@platt_park.name)
    expect(page).to have_content(@left_hand.name)
    expect(page).to have_content(@odell.name)
  end

  it 'displays breweries in ascending order by creation date' do
    visit '/breweries'
    save_and_open_page

    expect(@platt_park.name).to appear_before(@left_hand.name)
  end

  it 'displays creation date and time for each brewery' do
    visit '/breweries'
    save_and_open_page

    expect(page).to have_content(@left_hand.created_at)
    expect(page).to have_content(@platt_park.created_at)
    expect(page).to have_content(@odell.created_at)
  end
end
