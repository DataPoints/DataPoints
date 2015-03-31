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

ActiveRecord::Schema.define(version: 20150316201502) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analysis_results", force: true do |t|
    t.integer  "dataset_id"
    t.json     "result"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "analysisProgress", default: 0
  end

  add_index "analysis_results", ["dataset_id"], name: "index_analysis_results_on_dataset_id", using: :btree

  create_table "columns", force: true do |t|
    t.integer  "header_id"
    t.string   "label"
    t.integer  "type_id"
    t.string   "datatyp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "columns", ["header_id"], name: "index_columns_on_header_id", using: :btree
  add_index "columns", ["type_id"], name: "index_columns_on_type_id", using: :btree

  create_table "coordinates", force: true do |t|
    t.string   "mesto"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coordinates", ["mesto"], name: "index_coordinates_on_mesto", unique: true, using: :btree

  create_table "datasets", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "link"
    t.integer  "user_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "data_table_name"
    t.decimal  "analyzed_progress",           default: 0.0
    t.boolean  "deleted",                     default: false
    t.string   "status"
    t.string   "storage"
    t.string   "filehash"
    t.string   "originuri"
    t.string   "downloadstatus",    limit: 1
    t.integer  "downloadProgress"
  end

  add_index "datasets", ["user_id", "created_at"], name: "index_datasets_on_user_id_and_created_at", using: :btree
  add_index "datasets", ["user_id"], name: "index_datasets_on_user_id", using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "first_datasets", force: true do |t|
    t.string "Obchodne_meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto_Obec"
    t.string "ICO"
    t.string "Vyska_pohladavky"
    t.string "Typ_platitela"
  end

  create_table "headers", force: true do |t|
    t.boolean  "origin"
    t.integer  "dataset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "headers", ["dataset_id"], name: "index_headers_on_dataset_id", using: :btree

  create_table "summaries", force: true do |t|
    t.integer "dataset_id"
    t.text    "header"
    t.float   "min"
    t.float   "max"
    t.float   "median"
    t.float   "mean"
  end

  create_table "types", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.boolean  "isAdmin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "columns", "headers", name: "columns_header_id_fk"

  add_foreign_key "datasets", "users", name: "datasets_user_id_fk"

  add_foreign_key "headers", "datasets", name: "headers_dataset_id_fk"

end
