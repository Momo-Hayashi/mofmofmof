ActiveRecord::Schema.define(version: 2021_06_17_083530) do

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
