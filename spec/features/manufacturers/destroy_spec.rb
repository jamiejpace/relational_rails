require 'rails_helper'

RSpec.describe 'Manufacturer destroy' do
  it "has a link to delete manufacturer" do
    campari_group = Manufacturer.create!(name: "Campari Group", year_established: 1860, domestic: false)

    visit "/manufacturers/#{campari_group.id}"

    click_link('Delete Manufacturer')

    expect(current_path).to eq('/manufacturers')
    expect(page).to_not have_content("Campari Group")
  end
end
