# User Story 11, Parent Creation (x2)
#
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
require 'rails_helper'

RSpec.describe 'brewery creation' do
  it 'links to the new brewery page from the brewery index' do
    visit '/breweries'

    click_link('New Brewery')

    expect(current_path).to eq('/breweries/new')
  end

  it 'can create a new brewery using a form' do
    visit '/breweries/new'
    save_and_open_page

    fill_in('Name', with: 'Great Divide Brewing')
    fill_in('Year established', with: 2004)
    fill_in('Food available', with: true)
    click_button('Create Brewery')

    expect(current_path).to eq('/breweries')
    expect(page).to have_content("Great Divide Brewing")
  end
end
