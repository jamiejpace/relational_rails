require 'rails_helper'

RSpec.describe 'Booze destroy' do
  it "has a link to delete booze" do
    brown_forman = Manufacturer.create!(name: "Brown-Forman", year_established: 1870, domestic: true)
    korbel = brown_forman.boozes.create!(name: "Korbel", clear: false, abv: 12.0, proof: 24, booze_type: "Champagne")

    visit "/boozes/#{korbel.id}"

    click_link('Delete Booze')

    expect(current_path).to eq('/boozes')
    expect(page).to_not have_content("Korbel")
  end
end
