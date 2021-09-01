require 'rails_helper'

RSpec.describe 'brewery edit' do
  it 'links to the edit page' do
    brewery = Brewery.create!(name: "Great Divide Brewing", year_established: 2004, food_available: true)
    visit "/breweries/#{brewery.id}"
  
    click_link "Update Brewery"

    expect(current_path).to eq("/breweries/#{brewery.id}/edit")
  end

  it 'can edit the brewery' do
    brewery = Brewery.create!(name: "Grate Divide Brewing", year_established: 2004, food_available: true)
    visit "/breweries/#{brewery.id}"

    expect(page).to have_content("Grate Divide Brewing")

    click_link "Update Brewery"

    fill_in 'Name', with: "Great Divide Brewing"
    fill_in 'Year established', with: 2004
    check 'Food available'

    click_button 'Submit changes'

    expect(current_path).to eq("/breweries/#{brewery.id}")
    expect(page).to have_content("Great Divide Brewing")
  end
end
