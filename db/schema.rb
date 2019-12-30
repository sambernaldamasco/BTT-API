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

ActiveRecord::Schema.define(version: 20191230193319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.bigint "practice_id"
    t.bigint "skater_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["practice_id"], name: "index_attendances_on_practice_id"
    t.index ["skater_id"], name: "index_attendances_on_skater_id"
  end

  create_table "practices", force: :cascade do |t|
    t.string "date"
    t.string "location"
    t.boolean "has_happened"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_practices_on_team_id"
  end

  create_table "skaters", force: :cascade do |t|
    t.string "name"
    t.boolean "accepted", default: false
    t.boolean "veteran", default: false
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_skaters_on_team_id"
  end

  create_table "skills", force: :cascade do |t|
    t.integer "lateral_movement", default: 1
    t.integer "hockey_stop", default: 1
    t.integer "plow_stop", default: 1
    t.integer "turning_toe", default: 1
    t.integer "power_slide", default: 1
    t.integer "transitions", default: 1
    t.integer "backwards_skating", default: 1
    t.integer "speed_endurance", default: 1
    t.integer "recovery", default: 1
    t.integer "pack_work", default: 1
    t.integer "strategy_adaptability", default: 1
    t.integer "awareness_communication", default: 1
    t.integer "mental_recovery", default: 1
    t.bigint "skater_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skater_id"], name: "index_skills_on_skater_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "invite_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "attendances", "practices"
  add_foreign_key "attendances", "skaters"
  add_foreign_key "practices", "teams"
  add_foreign_key "skaters", "teams"
  add_foreign_key "skills", "skaters"
  add_foreign_key "users", "teams"
end
