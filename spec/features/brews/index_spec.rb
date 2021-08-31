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

  it 'displays all of the names of the brews and their attributes' do
    visit '/brews'

    expect(page).to have_content(@watermelon.name)
    expect(page).to have_content(@flamingo.abv)
    expect(page).to have_content(@peach.on_tap)
  end

  it 'displays a link at the top of each page that takes user to the brews index' do
    visit '/breweries'

    expect(page).to have_link("Brews Index", :href=>"/brews")

    click_link('Brews Index')

    expect(current_path).to eq('/brews')
  end

  it 'only displays brews that are on tap' do
    visit '/brews'

    expect(page).to have_content("Peach Stand Rambler Blonde Ale")
    expect(page).to_not have_content("Drumroll")
  end

  it 'has a link next to every Brew that takes user to the brew edit page' do
    visit '/brews'

    expect(page).to have_link("Update #{@watermelon.name}", :href=>"/brews/#{@watermelon.id}/edit")
    expect(page).to have_link("Update #{@sippin.name}", :href=>"/brews/#{@sippin.id}/edit")
    expect(page).to have_link("Update #{@cowboy.name}", :href=>"/brews/#{@cowboy.id}/edit")

    click_link("Update #{@cowboy.name}")

    expect(current_path).to eq("/brews/#{@cowboy.id}/edit")
  end
end
