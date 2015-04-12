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

ActiveRecord::Schema.define(version: 20150412130338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "1:1", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:10", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:100", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:101", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:102", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:103", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:104", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:106", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:108", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:109", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:11", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:110", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:111", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:112", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:113", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:115", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:118", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:119", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:12", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:120", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:121", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:122", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:123", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:124", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:125", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:126", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:127", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:128", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:129", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:13", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:130", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:131", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:132", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:133", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:134", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:135", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:136", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:137", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:138", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:139", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:14", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:142", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:143", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:144", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:145", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:146", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:147", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:148", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:149", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:15", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:150", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:151", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:152", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:153", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:154", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:155", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:156", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:157", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:158", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:159", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:16", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:160", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:161", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:162", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:163", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:168", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:169", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:17", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:170", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:171", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:172", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:173", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:177", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:179", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:18", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:180", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa\"A - BODKA, S.R.O."
    t.string "4014"
    t.string "MLIEČNA 15"
    t.string "KOŠICE"
    t.string "36591980"
    t.string "302.65"
    t.string "Zamestnavatel\"A - DESIGN S.R.O."
    t.string "82101"
    t.string "HABURSKÁ 20"
    t.string "BRATISLAVA"
    t.string "36181889"
    t.string "35.4"
    t.string "Zamestnavatel\"A - DUAL, S.R.O."
    t.string "97411"
    t.string "RUDLOVSKÁ CESTA 85"
    t.string "BANSKÁ BYSTRICA"
    t.string "36188212"
    t.string "2694.31"
    t.string "Zamestnavatel\"A - RECOL, S.R.O."
    t.string "4011"
    t.string "NEŠPOROVA 284/8"
    t.string "31718159"
    t.string "2837.23"
    t.string "Zamestnavatel\"A - Z MODEL, S.R.O."
    t.string "96001"
    t.string "NOVOZÁMOCKÁ 1447/27"
    t.string "ZVOLEN"
    t.string "36618519"
    t.string "630.24"
    t.string "Zamestnavatel\"A A T NITRA, S.R.O."
    t.string "94901"
    t.string "NARCISOVÁ 3"
    t.string "NITRA"
    t.string "36556246"
    t.string "406.64"
    t.string "Zamestnavatel\"A INÉ...S.R.O."
    t.string "91105"
    t.string "VLÁRSKA 16/298"
    t.string "TRENČÍN"
    t.string "44702159"
    t.string "107.8"
    t.string "Zamestnavatel\"A L C O T E X  SPOL. S R.O."
    t.string "98044"
    t.string "č.d. 268"
    t.string "CHANAVA"
    t.string "36179388"
    t.string "1747.23"
    t.string "Zamestnavatel\"A L E Š, S.R.O."
    t.string "PRAŽSKÁ 4"
    t.string "44932219"
    t.string "3961.47"
    t.string "Zamestnavatel\"A L U N A SPOL. S R.O."
    t.string "97901"
    t.string "KIREJEVSKÁ 35/40"
    t.string "RIMAVSKÁ SOBOTA"
    t.string "31575277"
    t.string "9654.97"
    t.string "Zamestnavatel\"A M A N T E , N.O."
    t.string "94632"
    t.string "LESNÁ 911/34"
    t.string "MARCELOVÁ"
    t.string "45740143"
    t.string "176.4"
    t.string "Zamestnavatel\"A M E X, SPOL. S R.O."
    t.string "90028"
    t.string "NÁDRAŽNÁ 34/1577"
    t.string "IVANKA PRI DUNAJI"
    t.string "30841348"
    t.string "3021.95"
    t.string "Zamestnavatel\"A P  STAV, SPOL. S R.O."
    t.string "97401"
    t.string "NÁMESTIE Š. MOYSESA 35/7"
    t.string "36026115"
    t.string "1573.7"
    t.string "Zamestnavatel\"A PROFIT SPOL. S.R.O."
    t.string "4001"
    t.string "JUŽNÁ TRIEDA 74/1595"
    t.string "36767310"
    t.string "678.9"
    t.string "Zamestnavatel\"A R G E N T S.R.O."
    t.string "4023"
    t.string "COTTBUSKÁ 28"
    t.string "36189324"
    t.string "1308.1"
    t.string "Zamestnavatel\"A T T O SPOL. S R.O."
    t.string "92701"
    t.string "HLAVNÁ 16"
    t.string "ŠAĽA"
    t.string "31448291"
    t.string "354.69"
    t.string "Zamestnavatel\"A V T, S.R.O."
    t.string "3901"
    t.string "MATIČNÁ UL. 1074"
    t.string "TURČIANSKE TEPLICE"
    t.string "31615392"
    t.string "2056.82"
    t.string "Zamestnavatel\"A 2 PEKÁRNE, S.R.O."
    t.string "RASTISLAVOVA 41"
    t.string "36657263"
    t.string "3740.76"
    t.string "Zamestnavatel\"A 3 MEDIA, S.R.O."
    t.string "82104"
    t.string "KOPANICE 4"
    t.string "35847247"
    t.string "644.37"
    t.string "Zamestnavatel\"A & L S. R. O."
    t.string "85101"
    t.string "ANDRUSOVOVA 5"
    t.string "44476841"
    t.string "1820.5"
    t.string "Zamestnavatel\"A & V BAČÍK, S.R.O."
    t.string "95501"
    t.string "AGÁTOVÁ 2227/1"
    t.string "TOPOĽČANY"
    t.string "36356867"
    t.string "8124.14"
    t.string "Zamestnavatel\"A + I WORK S.R.O."
    t.string "SLOVENSKEJ JEDNOTY 10"
    t.string "44750561"
    t.string "956.22"
    t.string "Zamestnavatel\"A- KERAMIKA A.S."
    t.string "82107"
    t.string "DVOJKRÍŽNA 49"
    t.string "36846431"
    t.string "3720.99"
    t.string "Zamestnavatel\"A-AKONTO, S.R.O."
    t.string "81104"
    t.string "ČAPKOVA 2"
    t.string "35829028"
    t.string "21.14"
    t.string "Zamestnavatel\"A-DEKA S.R.O."
    t.string "90301"
    t.string "ŠTÚROVA 44"
    t.string "SENEC"
    t.string "36723207"
    t.string "2505.2"
    t.string "Zamestnavatel\"A-HOLZ, S.R.O."
    t.string "1361"
    t.string "č.d. 161"
    t.string "KOTEŠOVÁ"
    t.string "36427071"
    t.string "1988.29"
    t.string "Zamestnavatel\"A-NA-NAS S. R. O."
    t.string "94123"
    t.string "č.d. 111"
    t.string "ANDOVCE"
    t.string "46395407"
    t.string "11.83"
    t.string "Zamestnavatel\"A-P STAV, S.R.O."
    t.string "93101"
    t.string "BRATISLAVSKÁ ULICA 1741"
    t.string "ŠAMORÍN"
    t.string "36239801"
    t.string "8083.15"
    t.string "Zamestnavatel\"A-PROJEKT S.R.O."
    t.string "82109"
    t.string "PRIEVOZSKÁ 1312/33"
    t.string "35865652"
    t.string "920.55"
    t.string "Zamestnavatel\"A-SOLUTIONS S.R.O."
    t.string "97409"
    t.string "SKUBÍNSKA CESTA 2932/52"
    t.string "44876939"
    t.string "1869.81"
    t.string "Zamestnavatel\"A-TATRY S.R.O."
    t.string "STRIEBORNÉ NÁMESTIE 2"
    t.string "44860153"
    t.string "514.73"
    t.string "Zamestnavatel\"A-TOP RENT S.R.O."
    t.string "83103"
    t.string "VARŠAVSKÁ 22"
    t.string "36763578"
    t.string "43.12"
    t.string "Zamestnavatel\"A-TOUR, S.R.O."
    t.string "NÁMESTIE Š. MOYSESA 7"
    t.string "36039322"
    t.string "33.95"
    t.string "Zamestnavatel\"A-TRADE SLOVAKIA, SPOL. S R.O."
    t.string "PRAŽSKÁ 2"
    t.string "44819897"
    t.string "222.69"
    t.string "Zamestnavatel\"A-TRANSIT S.R.O."
    t.string "7901"
    t.string "č.d. 89"
    t.string "KAPUŠIANSKE KĽAČANY"
    t.string "36854123"
    t.string "588"
    t.string "Zamestnavatel\"A-TS S.R.O."
    t.string "NERESNICKÁ CESTA 3A"
    t.string "36634590"
    t.string "423.82"
    t.string "Zamestnavatel\"A-U-PLANSTAV, S.R.O."
    t.string "TOMAŠOVSKÁ 6/1220"
    t.string "46130802"
    t.string "62.59"
    t.string "Zamestnavatel\"A-Z AQUA S.R.O."
    t.string "1501"
    t.string "č.d. 94"
    t.string "ĎURČINÁ"
    t.string "45940835"
    t.string "44.38"
    t.string "Zamestnavatel\"A-Z DOMSTAV, S.R.O."
    t.string "92201"
    t.string "č.d. 411"
    t.string "VEĽKÉ ORVIŠTE"
    t.string "36230430"
    t.string "1965.5"
    t.string "Zamestnavatel\"A-Z ELECTRIC SLOVAKIA, SPOL. S R.O."
    t.string "5801"
    t.string "ŠROBÁROVA 2668/13"
    t.string "POPRAD"
    t.string "31737901"
    t.string "754.6"
    t.string "Zamestnavatel\"A-Z GASTRO S.R.O."
    t.string "TATRANSKÁ 88"
    t.string "46586831"
    t.string "616.83"
    t.string "Zamestnavatel\"A-Z KOVO S.R.O."
    t.string "96202"
    t.string "HÁJNIKOVÁ 288"
    t.string "VÍGĽAŠ"
    t.string "45468621"
    t.string "3586.14"
    t.string "Zamestnavatel\"A-3DOM, SPOL. S R.O."
    t.string "TOVARNÍCKA 2104/14"
    t.string "43993877"
    t.string "11.46"
    t.string "Zamestnavatel\"AA AUTO, S.R.O."
    t.string "83104"
    t.string "STARÁ VAJNORSKÁ 4"
    t.string "35845279"
    t.string "10.38"
    t.string "Zamestnavatel\"AA RACING S. R. O."
    t.string "TRNAVSKÁ CESTA 112"
    t.string "43957994"
    t.string "53.63"
    t.string "Zamestnavatel\"AA TRADE, S.R.O."
    t.string "92401"
    t.string "ŠAFÁRIKOVA 1526/46"
    t.string "GALANTA"
    t.string "45925542"
    t.string "729.6"
    t.string "Zamestnavatel\"AAA DOMY S.R.O."
    t.string "8001"
    t.string "PLZENSKÁ 2"
    t.string "PREŠOV"
    t.string "44438150"
    t.string "200.62"
    t.string "Zamestnavatel\"AAA ZIMKLIMA, S.R.O."
    t.string "94142"
    t.string "č.d. 772"
    t.string "VEĽKÉ LOVCE"
    t.string "35973323"
    t.string "3116.63"
    t.string "Zamestnavatel\"AAAD S.R.O."
    t.string "5921"
    t.string "OKRUŽNÁ 27"
    t.string "SVIT"
    t.string "36467197"
    t.string "63.04"
    t.string "Zamestnavatel\"AAAUTO - PETER S.R.O."
    t.string "BRATISLAVSKÁ 40"
    t.string "46007156"
    t.string "953.53"
    t.string "Zamestnavatel\"AABA, S.R.O."
    t.string "3401"
    t.string "A. BERNOLÁKA 5185/6"
    t.string "RUŽOMBEROK"
    t.string "43884661"
    t.string "988.99"
    t.string "Zamestnavatel\"AADA, S.R.O."
    t.string "91101"
    t.string "28. OKTÓBRA 34"
    t.string "36310476"
    t.string "1116.43"
    t.string "Zamestnavatel\"AALL IN, S.R.O."
    t.string "KIREJEVSKÁ 361/27"
    t.string "36692565"
    t.string "206.95"
    t.string "Zamestnavatel\"AAM PEOPLE, S.R.O."
    t.string "RAYMANOVA 9"
    t.string "36665649"
    t.string "13072.15"
    t.string "Zamestnavatel\"AARON CORP, S.R.O."
    t.string "92901"
    t.string "č.d. 118"
    t.string "BOHEĽOV"
    t.string "46505491"
    t.string "690.29"
    t.string "Zamestnavatel\"AARON SALAMON & PARTNERS S.R.O."
    t.string "POTRAVINÁRSKA 15"
    t.string "36774561"
    t.string "3786.58"
    t.string "Zamestnavatel\"AB EXPERT, S. R. O."
    t.string "90201"
    t.string "DONA SANDTNERA 7"
    t.string "PEZINOK"
    t.string "45720703"
    t.string "293.86"
    t.string "Zamestnavatel\"AB MAT S.R.O."
    t.string "84106"
    t.string "BRATISLAVSKÁ 30"
    t.string "35697407"
    t.string "877.42"
    t.string "Zamestnavatel\"AB MÉDIUM, SPOL. S R.O."
    t.string "83102"
    t.string "ODBORÁRSKA 52"
    t.string "31368026"
    t.string "2251.63"
    t.string "Zamestnavatel\"AB SLOVAKIA, S.R.O."
    t.string "KYSUCKÁ 3416/27"
    t.string "36477818"
    t.string "1327.11"
    t.string "Zamestnavatel\"AB SORTIMENT, SPOL. S R.O."
    t.string "PODBEĽOVÁ 8280/1"
    t.string "31398251"
    t.string "232.88"
    t.string "Zamestnavatel\"AB-BAU SK, S.R.O."
    t.string "JILEMNICKÉHO 264/18"
    t.string "DUNAJSKÁ STREDA"
    t.string "44268335"
    t.string "62.06"
    t.string "Zamestnavatel\"AB-EUROMARKET, S.R.O."
    t.string "97101"
    t.string "ULICA A. ŽARNOVA 858/10"
    t.string "PRIEVIDZA"
    t.string "36707953"
    t.string "607.82"
    t.string "Zamestnavatel\"ABA SK ALFA S. R. O."
    t.string "81102"
    t.string "SVETLÁ 1"
    t.string "44924232"
    t.string "1200.23"
    t.string "Zamestnavatel\"ABAT S.R.O."
    t.string "PARTIZÁNSKA 3265/8"
    t.string "46049151"
    t.string "3080.05"
    t.string "Zamestnavatel\"ABB-LAS, S R.O."
    t.string "PODLAVICKÁ CESTA 31"
    t.string "36368334"
    t.string "70.85"
    t.string "Zamestnavatel\"ABC - SLUŽBA, S.R.O."
    t.string "81109"
    t.string "GRÖSSLINGOVÁ 25"
    t.string "36355453"
    t.string "5716.53"
    t.string "Zamestnavatel\"ABC - TECHNIK, SPOL. S R.O."
    t.string "95134"
    t.string "č.d. 278"
    t.string "BÁB"
    t.string "36423718"
    t.string "4237.7"
    t.string "Zamestnavatel\"ABC AUTO, SPOL. S R.O."
    t.string "JANKA KRÁĽA 1809/3"
    t.string "36048046"
    t.string "1544.01"
    t.string "Zamestnavatel\"ABC EUROPE S. R. O."
    t.string "ŠTÚROVA 13"
    t.string "35855487"
    t.string "261.6"
    t.string "Zamestnavatel\"ABC KLÍMA S.R.O."
    t.string "82102"
    t.string "TOMÁŠIKOVA 19"
    t.string "31354131"
    t.string "41926.7"
    t.string "Zamestnavatel\"ABC MARKET SLOVAKIA, SPOL. S R.O."
    t.string "82106"
    t.string "PODZÁHRADNÁ 10068/45"
    t.string "34100865"
    t.string "2934.85"
    t.string "Zamestnavatel\"ABC PLUS, SPOL. S R.O."
    t.string "J.  JANČEKA 14"
    t.string "36024490"
    t.string "376.92"
    t.string "Zamestnavatel\"ABC SLOVAKIA, S.R.O."
    t.string "82521"
    t.string "RUŽOVÁ DOLINA 6"
    t.string "36455865"
    t.string "311.62"
    t.string "Zamestnavatel\"ABC TRADING S.R.O."
    t.string "4419"
    t.string "č.d. 473"
    t.string "RUSKOV"
    t.string "44930941"
    t.string "105.56"
    t.string "Zamestnavatel\"ABC 7,S.R.O."
    t.string "1331"
    t.string "POD HRADISKOM 3/12"
    t.string "DIVINKA"
    t.string "46212752"
    t.string "936.64"
    t.string "Zamestnavatel\"ABCOM KOŠICE S.R.O."
    t.string "HLAVNÁ 119"
    t.string "46112961"
    t.string "19.19"
    t.string "Zamestnavatel\"ABCOM SLOVAKIA S.R.O."
    t.string "UL. BISKUPA KONDÉHO 18"
    t.string "36720151"
    t.string "50"
    t.string "Zamestnavatel\"ABD DEVELOPMENT S.R.O."
    t.string "83101"
    t.string "STROMOVÁ 13"
    t.string "35938293"
    t.string "37.64"
    t.string "Zamestnavatel\"ABDULGAFUR PIRGOZI"
    t.string "91451"
    t.string "ŠTVRŤ SNP 134/34"
    t.string "TRENČIANSKE TEPLICE"
    t.string "33913960"
    t.string "848.4"
    t.string "Zamestnavatel\"ABDULLA MOHAMMED ALI"
    t.string "0"
    t.string "HAJ - AL - TEŠRIE 0"
    t.string "ZELENÁ ZÓNA"
    t.string "47420855"
    t.string "573.26"
    t.string "SZCO\"ABDURAIM HASAN"
    t.string "1004"
    t.string "STRÁŽOVSKÁ 236/11"
    t.string "ŽILINA"
    t.string "46174150"
    t.string "700.96"
    t.string "SZCO\"ABE INTERNATIONAL S.R.O."
    t.string "GALVANIHO 7/D"
    t.string "46583921"
    t.string "42.38"
    t.string "Zamestnavatel\"ABE-STAV PIEŠŤANY, S R.O."
    t.string "92101"
    t.string "KRAJINSKÁ 2928/3"
    t.string "PIEŠŤANY"
    t.string "36277860"
    t.string "106.97"
    t.string "Zamestnavatel\"ABEL S. R. O."
    t.string "TRENČIANSKA 57"
    t.string "44464827"
    t.string "33.99"
    t.string "Zamestnavatel\"ÁBEL ŠTEFAN"
    t.string "85102"
    t.string "ROMANOVA 1676/46"
    t.string "13996738"
    t.string "236.7"
    t.string "SZCO\"ÁBEL VLADIMÍR"
    t.string "NOVÉ MESTO"
    t.string "30173817"
    t.string "4630.42"
    t.string "SZCO\"ÁBELOVIČ ĽUBOŠ"
    t.string "91955"
    t.string "č.d. 219"
    t.string "KÁTLOVCE"
    t.string "43400591"
    t.string "3689.42"
    t.string "SZCO\"ABELOVIČOVÁ GABRIELA"
    t.string "90901"
    t.string "LÚČKY 2580/2"
    t.string "SKALICA"
    t.string "33814864"
    t.string "3267.97"
    t.string "SZCO\"ÁBELOVSKY MILAN"
    t.string "94603"
    t.string "RÁBSKA 830/5"
    t.string "KOLÁROVO"
    t.string "35046155"
    t.string "7823.53"
    t.string "SZCO\"ABENA S.R.O."
    t.string "MOJMÍROVA 6"
    t.string "36513873"
    t.string "657.23"
    t.string "Zamestnavatel\"ABERŠTIK MILAN"
    t.string "95607"
    t.string "MAJERSKÁ 468/467"
    t.string "VEĽKÉ RIPŇANY"
    t.string "11766921"
    t.string "2771.53"
    t.string "SZCO\"ABG - CONSULT S. R. O."
    t.string "93003"
    t.string "č.d. 54"
    t.string "KRÁĽOVIČOVE KRAČANY"
    t.string "44222912"
    t.string "2709.5"
    t.string "Zamestnavatel\"ABI TRADE S.R.O."
    t.string "DEVÄTINOVA 5"
    t.string "46582207"
    t.string "549.6"
    t.string "Zamestnavatel\"ABISS PLUS, S.R.O."
    t.string "91601"
    t.string "GEN. M. R. ŠTEFÁNIKA 383/29"
    t.string "STARÁ TURÁ"
    t.string "36707767"
    t.string "137.85"
    t.string "Zamestnavatel\"ABITURA, S. R. O. V LIKVIDÁCII"
    t.string "82108"
    t.string "PRIEKOPY 20/A"
    t.string "45261741"
    t.string "15822.35"
    t.string "Zamestnavatel\"ABM - STAVING, S.R.O."
    t.string "1001"
    t.string "SASINKOVA 26"
    t.string "44116888"
    t.string "111.51"
    t.string "Zamestnavatel\"ABM, S.R.O. KOŠICE"
    t.string "4013"
    t.string "SOFIJSKÁ 27"
    t.string "36728322"
    t.string "4052.61"
    t.string "Zamestnavatel\"ABN CONSULTING, S. R. O."
    t.string "BOŽENY NĚMCOVEJ 9"
    t.string "45431060"
    t.string "432.29"
    t.string "Zamestnavatel\"ABO TRADE S.R.O."
    t.string "4012"
    t.string "NAPÁJADLÁ 6"
    t.string "36850055"
    t.string "4838.12"
  end

  create_table "1:181", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:183", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:185", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:186", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:188", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:19", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:191", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:194", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:2", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:20", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:201", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:202", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:204", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:206", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:208", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:209", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:21", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:210", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:211", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:22", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:228", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:229", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:23", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:24", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:25", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:26", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:27", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:28", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:29", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:3", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:30", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:31", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:32", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:33", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:34", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:35", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:36", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:37", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:38", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:39", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:4", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:40", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:41", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:42", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:43", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:44", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:45", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:46", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:47", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:48", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:49", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:5", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:50", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:51", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:52", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:53", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:54", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:55", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:56", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:57", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:58", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:59", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:6", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:60", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:61", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:62", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:63", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:64", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:65", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:67", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:68", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:69", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:7", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:70", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:71", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:72", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:73", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:74", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:75", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:76", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:77", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:78", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:79", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:8", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:80", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:81", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:82", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:83", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:84", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:85", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:86", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:87", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:9", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:90", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:91", force: true do |t|
    t.string "Obchodne meno"
    t.string "PSC"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "ICO"
    t.string "Vyska pohladavky"
    t.string "Typ platitela"
  end

  create_table "1:92", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:93", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
    t.string "Typ platiteľa"
  end

  create_table "1:94", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:95", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:96", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:97", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:98", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

  create_table "1:99", force: true do |t|
    t.string "Obchodné meno"
    t.string "PSČ"
    t.string "Ulica"
    t.string "Mesto / Obec"
    t.string "IČO"
    t.string "Výška pohľadávky"
  end

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
    t.boolean  "analyze",    default: false
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
    t.string "Vyska_poladavky"
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
