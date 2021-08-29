require 'rails_helper'

RSpec.describe 'Brewery show' do
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

    it "shows the brewery with that id including the brewery attributes" do

    visit "/breweries/#{@left_hand.id}"
    save_and_open_page

    expect(page).to have_content(@left_hand.name)
    expect(page).to have_content(@left_hand.year_established)
    expect(page).to have_content(@left_hand.food_available)
  end

  it "shows the number of beers manufactured by this brewery" do
    visit "/breweries/#{@odell.id}"
    save_and_open_page

    expect(page).to have_content(@left_hand.brews.count)
  end

  it 'displays a link on each page that takes user to the brew index per brewery' do
    visit "/breweries/#{@left_hand.id}"
    save_and_open_page

    expect(page).to have_link("List of Their Brews", :href=>"/breweries/#{@left_hand.id}/brews")

    click_link('List of Their Brews')

    expect(current_path).to eq("/breweries/#{@left_hand.id}/brews")
  end
end
