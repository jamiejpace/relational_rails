require 'rails_helper'

RSpec.describe 'manfacturer creation' do
  it "links to the new manufacturer page from the manufacturer index" do
    visit '/manufacturers'

    click_link('New Manufacturer')

    expect(current_path).to eq('/manufacturers/new')
  end

  it "can create a new manufacturer using a form" do
    visit '/manufacturers/new'
    save_and_open_page

    fill_in('Name', with: 'Pernod Ricard SA')
    fill_in('Year established', with: 1975)
    fill_in('Domestic', with: false)
    click_button('Create Manufacturer')

    expect(current_path).to eq('/manufacturers')
    expect(page).to have_content("Pernod Ricard SA")
  end
end
