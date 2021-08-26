require 'rails_helper'

RSpec.describe 'Manufacturer index' do
  before :each do
    @brown_forman = Manufacturer.create!(name: "Brown-Forman", year_established: 1870, domestic: true)
    @diageo = Manufacturer.create!(name: "Diageo", year_established: 1997, domestic: false)
    @campari_group = Manufacturer.create!(name: "Campari Group", year_established: 1860, domestic: false)
  end

    it "shows the manufacturer with that id including the manufacturers attributes" do

    visit "/manufacturers/#{@campari_group.id}"
    save_and_open_page

    expect(page).to have_content(@campari_group.name)
    expect(page).to have_content(@campari_group.year_established)
    expect(page).to have_content(@campari_group.domestic)

  end
end
