# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_21_084105) do
  create_table "employment_contracts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "brutto"
    t.integer "netto"
    t.string "organisation"
    t.integer "vacation"
    t.integer "working_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employment_contracts_on_user_id"
  end

  create_table "fixed_costs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "rent", default: 0
    t.integer "electricity", default: 0
    t.integer "internet", default: 0
    t.integer "food", default: 0
    t.integer "mobile", default: 0
    t.integer "savings_plan", default: 0
    t.integer "misc", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fixed_costs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "employment_contracts", "users"
  add_foreign_key "fixed_costs", "users"
end
