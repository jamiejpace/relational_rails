# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Brewery.destroy_all
Brew.destroy_all
Manufacturer.destroy_all
Booze.destroy_all

platt_park = Brewery.create!(name: "Platt Park Brewing", year_established: 2013, food_available: true)
left_hand = Brewery.create!(name: "Left Hand Brewing", year_established: 2006, food_available: false)
odell = Brewery.create!(name: "Odell Brewing", year_established: 2000, food_available: true)

watermelon = platt_park.brews.create!(name: "Watermelon Sour", abv: 4.1, beer_type: "Sour", gluten_free: false, on_tap: true)
madagascar = platt_park.brews.create!(name: "Madagascar Dream", abv: 6.7, beer_type: "Cream Ale", gluten_free: false, on_tap: true)
astronaut = platt_park.brews.create!(name: "Astronaut Amber", abv: 5.1, beer_type: "Red Ale", gluten_free: false, on_tap: true)

tiki = left_hand.brews.create!(name: "Gettin' Tiki With It Nitro", abv: 7.5, beer_type: "Wheat Ale", gluten_free: false, on_tap: false)
flamingo = left_hand.brews.create!(name: "Flamingo Dreams Nitro", abv: 4.7, beer_type: "Blonde Ale", gluten_free: false, on_tap: true)
cowboy = left_hand.brews.create!(name: "Galactic Cowboy Nitro", abv: 9.0, beer_type: "Imperial Stout", gluten_free: false, on_tap: true)

sippin = odell.brews.create!(name: "Sippin' Pretty Fruited Sour", abv: 4.5, beer_type: "Sour", gluten_free: false, on_tap: true)
peach = odell.brews.create!(name: "Peach Stand Rambler Blonde Ale", abv: 5.1, beer_type: "Blonde Ale", gluten_free: false, on_tap: true)
drumroll = odell.brews.create!(name: "Drumroll", abv: 5.3, beer_type: "Pale Ale", gluten_free: false, on_tap: false)

brown_forman = Manufacturer.create!(name: "Brown-Forman", year_established: 1870, domestic: true)
diageo = Manufacturer.create!(name: "Diageo", year_established: 1997, domestic: false)
campari_group = Manufacturer.create!(name: "Campari Group", year_established: 1860, domestic: false)

woodford_reserve = brown_forman.boozes.create!(name: "Woodford Reserve", clear: false, abv: 45.2, proof: 90, booze_type: "Bourbon")
herradura = brown_forman.boozes.create!(name: "Herradura", clear: true, abv: 40.0, proof: 80, booze_type: "Tequila")
korbel = brown_forman.boozes.create!(name: "Korbel", clear: false, abv: 12.0, proof: 24, booze_type: "Champagne")

don_julio = diageo.boozes.create!(name: "Don Julio", clear: true, abv: 40.0, proof: 80, booze_type: "Tequila")
tanqueray = diageo.boozes.create!(name: "Tanqueray", clear: true, abv: 47.3, proof: 95, booze_type: "Gin")
baileys = diageo.boozes.create!(name: "Baileys", clear: false, abv: 17.0, proof: 34, booze_type: "Liqueur")

cabo_wabo = compari_group.boozes.create!(name: "Cabo Wabo", clear: true, abv: 40.0, proof: 80, booze_type: "Tequila")
aperol = compari_group.boozes.create!(name: "Aperol", clear: false, abv: 11.0, proof: 22, booze_type: "Apertif")
skyy = compari_group.boozes.create!(name: "SKYY", clear: true, abv: 40.0, proof: 80, booze_type: "Vodka")
