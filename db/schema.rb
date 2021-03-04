# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_04_041139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "care_recipitents", force: :cascade do |t|
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.integer "age", null: false
    t.integer "gender", null: false
    t.integer "degree_of_care_required", null: false
    t.integer "degree_of_support_required", null: false
    t.date "birthday", null: false
    t.text "remarks"
    t.boolean "suspend", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["family_name_kana", "given_name_kana"], name: "index_care_recipitents_on_family_name_kana_and_given_name_kana"
  end

  create_table "caregivers", force: :cascade do |t|
    t.string "name", null: false
    t.integer "age", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "hashed_password", null: false
  end

  create_table "intake_waters", force: :cascade do |t|
    t.date "drink_date", null: false
    t.integer "amount_of_water", null: false
    t.bigint "care_recipitent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["care_recipitent_id"], name: "index_intake_waters_on_care_recipitent_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.integer "age", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
  end

  create_table "vitals", force: :cascade do |t|
    t.bigint "care_recipitent_id", null: false
    t.date "measuring_date", null: false
    t.float "temperature", null: false
    t.integer "hign_blood_pressure", null: false
    t.integer "low_blood_pressure", null: false
    t.integer "breathing", null: false
    t.float "spo2", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "pulse", null: false
    t.index ["care_recipitent_id"], name: "index_vitals_on_care_recipitent_id"
  end

  add_foreign_key "intake_waters", "care_recipitents"
  add_foreign_key "vitals", "care_recipitents"
end
