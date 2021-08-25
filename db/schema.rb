# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_25_004955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boozes", force: :cascade do |t|
    t.string "name"
    t.boolean "clear"
    t.float "abv"
    t.integer "proof"
    t.string "type"
    t.bigint "manufacturer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manufacturer_id"], name: "index_boozes_on_manufacturer_id"
  end

  create_table "breweries", force: :cascade do |t|
    t.string "name"
    t.integer "year_established"
    t.boolean "food_available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brews", force: :cascade do |t|
    t.string "name"
    t.float "abv"
    t.string "type"
    t.boolean "gluten_free"
    t.boolean "on_tap"
    t.bigint "brewery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brewery_id"], name: "index_brews_on_brewery_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.integer "year_established"
    t.boolean "domestic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "boozes", "manufacturers"
  add_foreign_key "brews", "breweries"
end
