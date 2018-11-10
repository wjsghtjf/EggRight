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

ActiveRecord::Schema.define(version: 2018_11_10_055701) do

  create_table "albas", force: :cascade do |t|
    t.string "name"
    t.integer "money_hour", default: 0
    t.string "place"
    t.integer "s_hour", default: 0
    t.integer "s_minute", default: 0
    t.integer "e_hour", default: 0
    t.integer "e_minute", default: 0
    t.boolean "nightbonus", default: false
    t.boolean "weekbonus", default: false
    t.boolean "holidaybonus", default: false
    t.boolean "extendbonus", default: false
    t.boolean "tax", default: false
    t.string "color"
    t.integer "final2", default: 0
    t.integer "final", default: 0
    t.integer "distinguish"
    t.integer "dateDistinguish"
    t.integer "user_distinguish"
    t.integer "nightalpha"
    t.integer "holidayalpha"
    t.boolean "picked", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dailies", force: :cascade do |t|
    t.integer "ds_hour"
    t.integer "ds_minute"
    t.integer "de_hour"
    t.integer "de_minute"
    t.text "diary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "palettes", force: :cascade do |t|
    t.integer "user_id"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_palettes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer "count"
    t.integer "final"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
