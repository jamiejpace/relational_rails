require 'rails_helper'

RSpec.describe 'Brewery brews index' do
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

  it 'displays all the brews associated with the specified brewery and each brews attributes' do
    visit "/breweries/#{@odell.id}/brews"

    expect(page).to have_content(@sippin.name)
    expect(page).to have_content(@peach.abv)
    expect(page).to have_content(@drumroll.on_tap)
  end

  it 'has a link to sort brews in alphabetical order' do
    visit "/breweries/#{@odell.id}/brews"

    click_link 'Sort Brews Alphabetically'

    expect(current_path).to eq("/breweries/#{@odell.id}/brews")

    expect(@drumroll.name).to appear_before(@peach.name)
    expect(@peach.name).to appear_before(@sippin.name)
  end

  it 'has a link next to the Brew that takes user to the brew edit page' do
    visit "/breweries/#{@odell.id}/brews"

    expect(page).to have_link("Update #{@peach.name}", :href=>"/brews/#{@peach.id}/edit")

    click_link("Update #{@peach.name}")

    expect(current_path).to eq("/brews/#{@peach.id}/edit")
  end

  it 'has a form that returns records that meet threshold shown' do
    visit "/breweries/#{@odell.id}/brews"

    fill_in('Abv threshold', with: 5)
    click_button('Filter beers by ABV threshold')

    expect(current_path).to eq("/breweries/#{@odell.id}/brews")
    expect(page).to have_content("Peach Stand Rambler Blonde Ale")
    expect(page).to_not have_content("Sippin' Pretty Fruited Sour")
  end
end
