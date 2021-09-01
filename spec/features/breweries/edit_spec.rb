# User Story 12, Parent Update (x2)
#
# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info

require 'rails_helper'

RSpec.describe 'brewery edit' do
  it 'links to the edit page' do
    brewery = Brewery.create!(name: "Great Divide Brewing", year_established: 2004, food_available: true)
    visit "/breweries/#{brewery.id}"
    save_and_open_page
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
