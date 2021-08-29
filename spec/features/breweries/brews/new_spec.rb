# User Story 13, Parent Child Creation (x2)
#
# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

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
    fill_in('Gluten free', with: false)
    fill_in('On tap', with: true)

    click_button('Create Brew')

    expect(current_path).to eq("/breweries/#{brewery.id}/brews")
    expect(page).to have_content("Pigasus Porter")
  end
end
