require 'rails_helper'

RSpec.describe 'destroy brewery' do
  it 'has a link to delete brewery' do
    platt_park = Brewery.create!(name: "Platt Park Brewing", year_established: 2013, food_available: true)
    visit "/breweries/#{platt_park.id}"

    click_link "Delete Brewery"

    expect(current_path).to eq('/breweries')
  end

  it "can delete the brewery and all that brewery's beers and return to index" do
    platt_park = Brewery.create!(name: "Platt Park Brewing", year_established: 2013, food_available: true)
    visit "/breweries/#{platt_park.id}"

    click_link "Delete Brewery"

    expect(current_path).to eq('/breweries')
    expect(page).to_not have_content("Platt Park Brewing")
    expect(page).to_not have_link('Delete Brewery')
  end

  it "has a link to delete brewery next to every brewery on the index page" do
    platt_park = Brewery.create!(name: "Platt Park Brewing", year_established: 2013, food_available: true)
    left_hand = Brewery.create!(name: "Left Hand Brewing", year_established: 2006, food_available: false)
    odell = Brewery.create!(name: "Odell Brewing", year_established: 2000, food_available: true)

    visit '/breweries'

    click_link "Delete Platt Park Brewing"

    expect(current_path).to eq('/breweries')
    expect(page).to_not have_content("Platt Park Brewing")
    expect(page).to have_content("Left Hand Brewing")

    click_link "Delete Left Hand Brewing"

    expect(page).to_not have_content("Left Hand Brewing")

    click_link "Delete Odell Brewing"
    expect(page).to_not have_content("Odell Brewing")
  end
end
