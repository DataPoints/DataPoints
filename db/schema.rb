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

ActiveRecord::Schema.define(version: 20141127223537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "4:1", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "4:10", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "4:11", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "4:12", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "4:13", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "4:14", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "4:15", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "4:16", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "4:17", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "4:2", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "4:3", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "4:4", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "4:5", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "4:6", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "4:7", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "4:8", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "4:9", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

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

  create_table "datasets", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "link"
    t.integer  "user_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "status"
    t.boolean  "deleted",                     default: false
    t.string   "storage"
    t.decimal  "analyzed_progress",           default: 0.0
    t.string   "filehash"
    t.string   "originuri"
    t.string   "downloadstatus",    limit: 1
    t.string   "data_table_name"
  end

  add_index "datasets", ["user_id", "created_at"], name: "index_datasets_on_user_id_and_created_at", using: :btree
  add_index "datasets", ["user_id"], name: "index_datasets_on_user_id", using: :btree

  create_table "headers", force: true do |t|
    t.boolean  "origin"
    t.integer  "dataset_id"
    t.integer  "column_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "headers", ["column_id"], name: "index_headers_on_column_id", using: :btree
  add_index "headers", ["dataset_id"], name: "index_headers_on_dataset_id", using: :btree

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "columns", "headers", name: "columns_header_id_fk"

  add_foreign_key "datasets", "users", name: "datasets_user_id_fk"

  add_foreign_key "headers", "datasets", name: "headers_dataset_id_fk"

end
