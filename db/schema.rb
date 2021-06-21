ActiveRecord::Schema.define(version: 2021_06_18_034641) do

  create_table "closest_stations", force: :cascade do |t|
    t.string "line"
    t.string "station"
    t.integer "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "property_id"
    t.index ["property_id"], name: "index_closest_stations_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.text "name"
    t.integer "price"
    t.text "address"
    t.integer "years_old"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
