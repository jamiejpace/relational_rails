# User Story 20, Child Delete (x2)
#
# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child

require 'rails_helper'

RSpec.describe 'destroy brew' do
  it 'has a link to delete brew' do
    platt_park = Brewery.create!(name: "Platt Park Brewing", year_established: 2013, food_available: true)
    watermelon = platt_park.brews.create!(name: "Watermelon Sour", abv: 4.1, beer_type: "Sour", gluten_free: false, on_tap: true)

    visit "/brews/#{watermelon.id}"

    click_link "Delete Brew"

    expect(current_path).to eq('/brews')
  end

  it 'can delete the brew and return to the child index page' do
    platt_park = Brewery.create!(name: "Platt Park Brewing", year_established: 2013, food_available: true)
    watermelon = platt_park.brews.create!(name: "Watermelon Sour", abv: 4.1, beer_type: "Sour", gluten_free: false, on_tap: true)

    visit "/brews/#{watermelon.id}"
    save_and_open_page
    click_link "Delete Brew"
save_and_open_page
    expect(current_path).to eq('/brews')
    expect(page).to_not have_content("Watermelon Sour")
    expect(page).to_not have_link('Delete Brew')
  end
end
