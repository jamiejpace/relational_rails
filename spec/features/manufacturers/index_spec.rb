require 'rails_helper'

RSpec.describe 'Manufacturer index' do
  before :each do
    @brown_forman = Manufacturer.create!(name: "Brown-Forman", year_established: 1870, domestic: true)
    @diageo = Manufacturer.create!(name: "Diageo", year_established: 1997, domestic: false)
    @campari_group = Manufacturer.create!(name: "Campari Group", year_established: 1860, domestic: false)

    @woodford_reserve = @brown_forman.boozes.create!(name: "Woodford Reserve", clear: false, abv: 45.2, proof: 90, booze_type: "Bourbon")
    @herradura = @brown_forman.boozes.create!(name: "Herradura", clear: true, abv: 40.0, proof: 80, booze_type: "Tequila")
    @korbel = @brown_forman.boozes.create!(name: "Korbel", clear: false, abv: 12.0, proof: 24, booze_type: "Champagne")

    @don_julio = @diageo.boozes.create!(name: "Don Julio", clear: true, abv: 40.0, proof: 80, booze_type: "Tequila")
    @tanqueray = @diageo.boozes.create!(name: "Tanqueray", clear: true, abv: 47.3, proof: 95, booze_type: "Gin")
    @baileys = @diageo.boozes.create!(name: "Baileys", clear: false, abv: 17.0, proof: 34, booze_type: "Liqueur")

    @cabo_wabo = @campari_group.boozes.create!(name: "Cabo Wabo", clear: true, abv: 40.0, proof: 80, booze_type: "Tequila")
    @aperol = @campari_group.boozes.create!(name: "Aperol", clear: false, abv: 11.0, proof: 22, booze_type: "Apertif")
    @skyy = @campari_group.boozes.create!(name: "SKYY", clear: true, abv: 40.0, proof: 80, booze_type: "Vodka")
  end

  it 'shows all of the names of the manufacturers' do
    visit '/manufacturers'
    save_and_open_page

    expect(page).to have_content(@brown_forman.name)
    expect(page).to have_content(@diageo.name)
    expect(page).to have_content(@campari_group.name)
  end

  it "displays manufacturers in ascending order by creation date" do
    visit '/manufacturers'
    save_and_open_page

    expect(@brown_forman.name).to appear_before(@diageo.name)
    expect(@diageo.name).to appear_before(@campari_group.name)
  end

  it "displays creation date and time for each manufacturer" do
    visit '/manufacturers'
    save_and_open_page

    expect(page).to have_content(@brown_forman.name)
    expect(page).to have_content(@diageo.name)
    expect(page).to have_content(@campari_group.name)
  end

  it 'displays a link at the top of each page that takes user to the booze index' do
    visit '/boozes'
    save_and_open_page

    expect(page).to have_link("Manufacturers Index", :href=>"/manufacturers")

    click_link('Manufacturers Index')

    expect(current_path).to eq('/manufacturers')
  end
end
