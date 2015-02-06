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

ActiveRecord::Schema.define(version: 20150205180512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "leases", force: true do |t|
    t.integer  "renters_id"
    t.integer  "owners_id"
    t.integer  "properties_id"
    t.float    "pmt_amount"
    t.integer  "due_date"
    t.datetime "start_date"
    t.datetime "end_date"
  end

  add_index "leases", ["owners_id"], name: "index_leases_on_owners_id", using: :btree
  add_index "leases", ["properties_id"], name: "index_leases_on_properties_id", using: :btree
  add_index "leases", ["renters_id"], name: "index_leases_on_renters_id", using: :btree

  create_table "owners", force: true do |t|
    t.integer "venmo_id"
    t.string  "email"
    t.string  "password"
  end

  create_table "payments", force: true do |t|
    t.integer "lease_id"
    t.integer "pmt_month"
    t.integer "pmt_year"
    t.float   "pmt_amount"
    t.integer "completed_date"
  end

  add_index "payments", ["lease_id"], name: "index_payments_on_lease_id", using: :btree

  create_table "properties", force: true do |t|
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
  end

  create_table "renters", force: true do |t|
    t.integer "venmo_id"
    t.string  "email"
    t.string  "password"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

end
