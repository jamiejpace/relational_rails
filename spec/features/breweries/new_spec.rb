require 'rails_helper'

RSpec.describe 'brewery creation' do
  it 'links to the new brewery page from the brewery index' do
    visit '/breweries'

    click_link('New Brewery')

    expect(current_path).to eq('/breweries/new')
  end

  it 'can create a new brewery using a form' do
    visit '/breweries/new'

    fill_in('Name', with: 'Great Divide Brewing')
    fill_in('Year established', with: 2004)
    check 'Food available'
    click_button('Create Brewery')

    expect(current_path).to eq('/breweries')
    expect(page).to have_content("Great Divide Brewing")
  end
end
