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

ActiveRecord::Schema.define(version: 20150219030012) do

  create_table "admins", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  create_table "artist_surveys", force: true do |t|
    t.boolean  "has_attended_firefly"
    t.string   "has_attended_firefly_desc"
    t.boolean  "has_attended_regional"
    t.string   "has_attended_regional_desc"
    t.boolean  "has_attended_bm"
    t.string   "has_attended_bm_desc"
    t.boolean  "can_use_as_example"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artist_id"
  end

  add_index "artist_surveys", ["artist_id"], name: "index_artist_surveys_on_artist_id"

  create_table "artists", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_street"
    t.string   "contact_city"
    t.string   "contact_state"
    t.string   "contact_country"
  end

  create_table "grant_submissions", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "grant_id"
    t.integer  "artist_id"
    t.string   "proposal"
    t.integer  "requested_funding_dollars"
  end

  add_index "grant_submissions", ["artist_id"], name: "index_grant_submissions_on_artist_id"
  add_index "grant_submissions", ["grant_id"], name: "index_grant_submissions_on_grant_id"

  create_table "grants", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "max_funding_dollars"
  end

  create_table "voter_surveys", force: true do |t|
    t.boolean  "has_attended_firefly"
    t.boolean  "not_applying_this_year"
    t.boolean  "will_read"
    t.boolean  "will_meet"
    t.boolean  "has_been_voter"
    t.boolean  "has_participated_other"
    t.boolean  "has_received_grant"
    t.boolean  "has_received_other_grant"
    t.integer  "how_many_fireflies"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "voter_id"
  end

  add_index "voter_surveys", ["voter_id"], name: "index_voter_surveys_on_voter_id"

  create_table "voters", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

# Could not dump table "votes" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
