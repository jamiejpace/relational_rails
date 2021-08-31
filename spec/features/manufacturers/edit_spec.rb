require 'rails_helper'

RSpec.describe 'manufacturer edit' do
  it 'links to the edit page' do
    manufacturer = Manufacturer.create!(name: "JJ's Shitstillery", year_established: 2021, domestic: true)
    visit "/manufacturers/#{manufacturer.id}"
    
    click_link "Update Manufacturer"

    expect(current_path).to eq("/manufacturers/#{manufacturer.id}/edit")
  end

  it 'can edit the manufacturer' do
    manufacturer = Manufacturer.create!(name: "JJ's Shitstillery", year_established: 2021, domestic: true)
    visit "/manufacturers/#{manufacturer.id}"

    expect(page).to have_content("JJ's Shitstillery")

    click_link "Update Manufacturer"

    fill_in 'Name', with: "LordeJJ's Shitstillery"
    fill_in 'Year established', with: 2021
    fill_in 'Domestic', with: true

    click_button 'Submit changes'

    expect(current_path).to eq("/manufacturers/#{manufacturer.id}")
    expect(page).to have_content("LordeJJ's Shitstillery")
  end
end
