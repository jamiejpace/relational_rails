require 'rails_helper'

RSpec.describe 'Brewery index' do
  before :each do
    @platt_park = Brewery.create!(name: "Platt Park Brewing", year_established: 2013, food_available: true)
    @left_hand = Brewery.create!(name: "Left Hand Brewing", year_established: 2006, food_available: false)
    @odell = Brewery.create!(name: "Odell Brewing", year_established: 2000, food_available: true)
  end

  it 'shows all of the names of the breweries' do
    visit '/breweries'

    expect(page).to have_content(@platt_park.name)
    expect(page).to have_content(@left_hand.name)
    expect(page).to have_content(@odell.name)
  end

  it 'displays breweries in ascending order by creation date' do
    visit '/breweries'

    expect(@platt_park.name).to appear_before(@left_hand.name)
  end

  it 'displays creation date and time for each brewery' do
    visit '/breweries'

    expect(page).to have_content(@left_hand.created_at)
    expect(page).to have_content(@platt_park.created_at)
    expect(page).to have_content(@odell.created_at)
  end

  it 'displays a link at the top of each page that takes user to the breweries index' do
    visit '/brews'

    expect(page).to have_link("Breweries Index", :href=>"/breweries")

    click_link('Breweries Index')

    expect(current_path).to eq('/breweries')
  end

  it 'has a link next to every Brewery that takes user to brewery edit page' do
    visit '/breweries'

    expect(page).to have_link("Update #{@platt_park.name}", :href=>"/breweries/#{@platt_park.id}/edit")
    expect(page).to have_link("Update #{@odell.name}", :href=>"/breweries/#{@odell.id}/edit")
    expect(page).to have_link("Update #{@left_hand.name}", :href=>"/breweries/#{@left_hand.id}/edit")

    click_link("Update #{@platt_park.name}")

    expect(current_path).to eq("/breweries/#{@platt_park.id}/edit")
  end
end
