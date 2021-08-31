require 'rails_helper'

RSpec.describe 'booze edit' do
  it 'links to the edit page' do
    brown_forman = Manufacturer.create!(name: "Brown-Forman", year_established: 1870, domestic: true)
    woodford_reserve = brown_forman.boozes.create!(name: "Woodford Reserve", clear: false, abv: 45.2, proof: 90, booze_type: "Bourbon")

    visit "/boozes/#{woodford_reserve.id}"
    save_and_open_page
    click_link "Update Booze"

    expect(current_path).to eq("/boozes/#{woodford_reserve.id}/edit")
  end

  it 'can edit the booze' do
    brown_forman = Manufacturer.create!(name: "Brown-Forman", year_established: 1870, domestic: true)
    woodford_reserve = brown_forman.boozes.create!(name: "Woodfird Reserve", clear: false, abv: 45.2, proof: 90, booze_type: "Bourbon")

    visit "/boozes/#{woodford_reserve.id}"

    expect(page).to have_content("Woodfird Reserve")

    click_link "Update Booze"

    fill_in 'Name', with: "Woodford Reserve"
    fill_in 'Clear', with: false
    fill_in 'Abv', with: 45.2
    fill_in 'Proof', with: 90
    fill_in 'Booze type', with: "Bourbon"

    click_button "Update Booze"

    expect(current_path).to eq("/boozes/#{woodford_reserve.id}")
    expect(page).to have_content("Woodford Reserve")
  end
end
