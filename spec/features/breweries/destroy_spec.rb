# User Story 19, Parent Delete (x2)
#
# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent
require 'rails_helper'

RSpec.describe 'destroy brewery' do
  it 'has a link to delete brewery' do
    platt_park = Brewery.create!(name: "Platt Park Brewing", year_established: 2013, food_available: true)
    visit "/breweries/#{platt_park.id}"
    save_and_open_page
    click_link "Delete Brewery"

    expect(current_path).to eq('/breweries')
  end

  it "can delete the brewery and all that brewery's beers and return to index" do
    platt_park = Brewery.create!(name: "Platt Park Brewing", year_established: 2013, food_available: true)
    visit "/breweries/#{platt_park.id}"
    save_and_open_page
    click_link "Delete Brewery"

    expect(current_path).to eq('/breweries')
    expect(page).to_not have_content("Platt Park Brewing")
    expect(page).to_not have_link('Delete Brewery')
  end
end
