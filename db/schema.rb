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

ActiveRecord::Schema.define(version: 20161027191945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bets", force: :cascade do |t|
    t.integer "user_id"
    t.integer "matchups_competitors_id"
    t.integer "amount"
  end

  create_table "competitors", force: :cascade do |t|
    t.string "name"
  end

  create_table "matchup_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "matchups", force: :cascade do |t|
    t.string   "name"
    t.float    "odds"
    t.datetime "deadline"
    t.integer  "matchup_type_id"
  end

  create_table "matchups_competitors", force: :cascade do |t|
    t.integer "matchup_id"
    t.integer "competitor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "username"
    t.string  "password_digest"
    t.integer "balance"
  end

end
