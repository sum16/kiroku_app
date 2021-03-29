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

ActiveRecord::Schema.define(version: 2021_03_29_165701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "type", null: false
    t.string "postal_code"
    t.string "prefecture"
    t.string "city", null: false
    t.string "address1", null: false
    t.string "address2", null: false
    t.string "company_name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
    t.index ["type", "customer_id"], name: "index_addresses_on_type_and_customer_id", unique: true
  end

  create_table "bathing_days", force: :cascade do |t|
    t.date "bathing_date", null: false
    t.boolean "judge_bath", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "family_id"
    t.index ["family_id"], name: "index_bathing_days_on_family_id"
  end

  create_table "behavior_histories", force: :cascade do |t|
    t.date "behavior_history_date", null: false
    t.text "action_record", null: false
    t.time "behavior_time", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "family_id"
    t.index ["family_id"], name: "index_behavior_histories_on_family_id"
  end

  create_table "care_recipitents", force: :cascade do |t|
    t.string "family_name"
    t.string "given_name"
    t.string "family_name_kana"
    t.string "given_name_kana"
    t.integer "age"
    t.integer "gender"
    t.integer "degree_of_care_required"
    t.integer "degree_of_support_required"
    t.date "birthday"
    t.text "remarks"
    t.boolean "suspend", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "caregiver_id"
    t.index ["caregiver_id"], name: "index_care_recipitents_on_caregiver_id"
    t.index ["family_name_kana", "given_name_kana"], name: "index_care_recipitents_on_family_name_kana_and_given_name_kana"
  end

  create_table "caregivers", force: :cascade do |t|
    t.string "name", null: false
    t.integer "age", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  create_table "customers", force: :cascade do |t|
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.string "gender"
    t.string "hashed_password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["family_name", "given_name"], name: "index_customers_on_family_name_and_given_name"
    t.index ["family_name"], name: "index_customers_on_family_name"
    t.index ["family_name_kana", "given_name_kana"], name: "index_customers_on_family_name_kana_and_given_name_kana"
    t.index ["family_name_kana", "given_name_kana"], name: "index_customers_on_furigana"
    t.index ["family_name_kana"], name: "index_customers_on_family_name_kana"
    t.index ["gender", "family_name_kana", "given_name_kana"], name: "index_customers_on_gender_and_furigana"
    t.index ["given_name"], name: "index_customers_on_given_name"
    t.index ["given_name_kana"], name: "index_customers_on_given_name_kana"
  end

  create_table "entries", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "family_id", null: false
    t.boolean "approved", default: false, null: false
    t.boolean "canceled", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["family_id"], name: "index_entries_on_family_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "registrant_id", null: false
    t.string "title", null: false
    t.string "description"
    t.datetime "application_start_time", null: false
    t.datetime "application_end_time", null: false
    t.integer "min_number_of_participants"
    t.integer "max_number_of_participants"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "excreta", force: :cascade do |t|
    t.date "excreta_date", null: false
    t.boolean "judge_shit", default: false, null: false
    t.boolean "judge_pee", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "family_id"
    t.index ["family_id"], name: "index_excreta_on_family_id"
  end

  create_table "families", force: :cascade do |t|
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.string "address", null: false
    t.integer "gender", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "relationship", default: "", null: false
    t.string "password_digest"
  end

  create_table "intake_waters", force: :cascade do |t|
    t.date "drink_date", null: false
    t.integer "amount_of_water", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "family_id"
    t.index ["family_id"], name: "index_intake_waters_on_family_id"
  end

  create_table "meals", force: :cascade do |t|
    t.boolean "breakfast", default: false, null: false
    t.boolean "lunch", default: false, null: false
    t.boolean "dinner", default: false, null: false
    t.boolean "snack", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "meal_date", null: false
    t.bigint "family_id"
    t.index ["family_id"], name: "index_meals_on_family_id"
  end

  create_table "medical_histories", force: :cascade do |t|
    t.bigint "care_recipitent_id", null: false
    t.string "past_disease"
    t.string "current_disease"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["care_recipitent_id"], name: "index_medical_histories_on_care_recipitent_id"
  end

  create_table "medicines", force: :cascade do |t|
    t.date "medicine_date", null: false
    t.boolean "check_before_breakfast", default: false, null: false
    t.boolean "check_before_lunch", default: false, null: false
    t.boolean "check_after_lunch", default: false, null: false
    t.boolean "check_before_dinner", default: false, null: false
    t.boolean "check_after_dinner", default: false, null: false
    t.boolean "check_ointment", default: false, null: false
    t.boolean "check_eye_drops", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "check_after_breakfast", default: false, null: false
    t.bigint "family_id"
    t.index ["family_id"], name: "index_medicines_on_family_id"
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
    t.date "measuring_date", null: false
    t.float "temperature", null: false
    t.integer "hign_blood_pressure", null: false
    t.integer "low_blood_pressure", null: false
    t.integer "breathing", null: false
    t.float "spo2", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "pulse", null: false
    t.bigint "family_id"
    t.index ["family_id"], name: "index_vitals_on_family_id"
  end

  add_foreign_key "addresses", "customers"
  add_foreign_key "bathing_days", "families"
  add_foreign_key "behavior_histories", "families"
  add_foreign_key "care_recipitents", "caregivers"
  add_foreign_key "events", "caregivers", column: "registrant_id"
  add_foreign_key "excreta", "families"
  add_foreign_key "intake_waters", "families"
  add_foreign_key "meals", "families"
  add_foreign_key "medical_histories", "care_recipitents"
  add_foreign_key "medicines", "families"
  add_foreign_key "vitals", "families"
end
