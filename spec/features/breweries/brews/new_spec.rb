require 'rails_helper'

RSpec.describe 'brewery brews creation' do
  it 'links to the new page from the brewery brews index' do
    brewery = Brewery.create!(name: "Kannah Creek Brewing", year_established: 2001, food_available: true)
    visit "/breweries/#{brewery.id}/brews"

    click_link "Create Brew"

    expect(current_path).to eq("/breweries/#{brewery.id}/brews/new")
  end

  it 'can create a new brewery brew' do
    brewery = Brewery.create!(name: "Kannah Creek Brewing", year_established: 2001, food_available: true)
    visit "/breweries/#{brewery.id}/brews/new"

    fill_in('Name', with: "Pigasus Porter")
    fill_in('Abv', with: 4.75)
    fill_in('Beer type', with: "Porter")
    uncheck 'Gluten free'
    check 'On tap'

    click_button('Create Brew')

    expect(current_path).to eq("/breweries/#{brewery.id}/brews")
    expect(page).to have_content("Pigasus Porter")
    expect(page).to have_content("false")
  end
end
