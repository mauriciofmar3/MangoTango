# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140414160708) do

  create_table "cards", force: true do |t|
    t.integer  "game_id"
    t.integer  "word_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "chosen"
    t.integer  "used",       default: 0
  end

  create_table "chat_logs", force: true do |t|
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.string   "name"
    t.boolean  "finished"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "max_rounds"
    t.integer  "max_players"
    t.integer  "current_round",     default: 0
    t.integer  "current_player_id"
  end

  create_table "players", force: true do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "words", force: true do |t|
    t.string   "word"
    t.boolean  "adjective",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
