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

ActiveRecord::Schema.define(version: 20140830161229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: true do |t|
    t.string   "uuid"
    t.string   "type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cards", ["user_id"], name: "index_cards_on_user_id", using: :btree
  add_index "cards", ["uuid"], name: "index_cards_on_uuid", using: :btree

  create_table "histories", force: true do |t|
    t.integer  "won_by_id"
    t.integer  "lost_by_id"
    t.integer  "card_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "histories", ["card_id"], name: "index_histories_on_card_id", using: :btree
  add_index "histories", ["lost_by_id"], name: "index_histories_on_lost_by_id", using: :btree
  add_index "histories", ["won_by_id"], name: "index_histories_on_won_by_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
    t.string   "url"
    t.integer  "cards_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree

end
