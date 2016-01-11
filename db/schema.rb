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

ActiveRecord::Schema.define(version: 20160110233317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "value"
    t.string   "ranking"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "ranking_value"
  end

  create_table "boxes", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "unit"
    t.string   "city"
    t.string   "zip"
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "state"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "business_hours", force: :cascade do |t|
    t.integer  "box_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "day"
    t.integer  "close_time"
    t.integer  "open_time"
  end

  create_table "images", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "box_id"
  end

  create_table "klasses", force: :cascade do |t|
    t.integer  "box_id",      null: false
    t.string   "day",         null: false
    t.integer  "start_time",  null: false
    t.integer  "end_time",    null: false
    t.string   "description"
    t.string   "name",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "phone"
    t.string   "home_gym"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "gender"
    t.boolean  "is_crossfitter"
    t.boolean  "is_box_owner"
    t.string   "overall_ranking"
    t.float    "overall_ranking_value", default: 0.0
  end

end
