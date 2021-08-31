# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

require 'rails_helper'

RSpec.describe 'manufacturer booze creation' do
  it 'links to the new page from the manufacturer boozes index' do
    manufacturer = Manufacturer.create!(name: "Get Vaxxed", year_established: 2021, domestic: true )
    visit "/manufacturers/#{manufacturer.id}/boozes"

    click_link "Create Booze"

    expect(current_path).to eq("/manufacturers/#{manufacturer.id}/boozes/new")
  end

  it "can create a new manufacturers booze" do
    manufacturer = Manufacturer.create!(name: "Get Vaxxed", year_established: 2021, domestic: true )
    visit "/manufacturers/#{manufacturer.id}/boozes/new"

    fill_in('Name', with: "Fauci Rules")
    fill_in('Clear', with: true)
    fill_in('Abv', with: 40.0)
    fill_in('Proof', with: 80)
    fill_in('Booze type', with: "Tequila")

    click_button("Create Booze")

    expect(current_path).to eq("/manufacturers/#{manufacturer.id}/boozes")
    expect(page).to have_content("Fauci Rules")
  end
end
