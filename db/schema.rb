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

ActiveRecord::Schema.define(version: 20180314175532) do

  create_table "player_games", force: :cascade do |t|
    t.integer "player_id"
    t.string "position"
    t.string "team"
    t.integer "cost"
    t.integer "point_last_round"
    t.integer "total_points"
    t.float "average_points"
    t.integer "yellow_cards"
    t.integer "transfers_out"
    t.integer "goals_scored"
    t.integer "saves"
    t.integer "value_season"
    t.integer "price_rise"
    t.integer "last_season_points"
    t.integer "value_form"
    t.integer "penalties_missed"
    t.integer "form"
    t.integer "bonus"
    t.float "selected_by_percent"
    t.integer "transfers_in"
    t.integer "minutes_played"
    t.integer "transfers_in_round"
    t.integer "red_cards"
    t.integer "bps"
    t.float "forecast"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "week"
    t.integer "season"
    t.float "actual"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "surname"
    t.string "position"
    t.string "team"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
