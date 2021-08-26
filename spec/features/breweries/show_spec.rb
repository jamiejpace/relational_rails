require 'rails_helper'

RSpec.describe 'Brewery show' do
  before :each do
    @platt_park = Brewery.create!(name: "Platt Park Brewing", year_established: 2013, food_available: true)
    @left_hand = Brewery.create!(name: "Left Hand Brewing", year_established: 2006, food_available: false)
    @odell = Brewery.create!(name: "Odell Brewing", year_established: 2000, food_available: true)
  end

    it "shows the brewery with that id including the brewery attributes" do

    visit "/breweries/#{@left_hand.id}"
    save_and_open_page

    expect(page).to have_content(@left_hand.name)
    expect(page).to have_content(@left_hand.year_established)
    expect(page).to have_content(@left_hand.food_available)

  end
end
