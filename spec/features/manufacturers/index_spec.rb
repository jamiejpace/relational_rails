require 'rails_helper'

RSpec.describe 'Manufacturer index' do
  before :each do
    @brown_forman = Manufacturer.create!(name: "Brown-Forman", year_established: 1870, domestic: true)
    @diageo = Manufacturer.create!(name: "Diageo", year_established: 1997, domestic: false)
    @campari_group = Manufacturer.create!(name: "Campari Group", year_established: 1860, domestic: false)
  end

  it 'shows all of the names of the manufacturers' do
    visit '/manufacturers'
    save_and_open_page

    expect(page).to have_content(@brown_forman.name)
    expect(page).to have_content(@diageo.name)
    expect(page).to have_content(@campari_group.name)
  end
end
