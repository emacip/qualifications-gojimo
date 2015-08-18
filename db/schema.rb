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

ActiveRecord::Schema.define(version: 20150818213919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "assets", id: false, force: true do |t|
    t.string   "id"
    t.string   "copyright"
    t.string   "meta"
    t.integer  "size"
    t.string   "path"
    t.string   "unzipped_base_url"
    t.hstore   "info"
    t.string   "link"
    t.integer  "default_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "countries", ["code"], name: "index_countries_on_code", using: :btree

  create_table "default_products", id: false, force: true do |t|
    t.string   "id"
    t.string   "title"
    t.string   "link"
    t.integer  "qualification_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "default_products", ["id"], name: "index_default_products_on_id", using: :btree

  create_table "qualifications", id: false, force: true do |t|
    t.string   "id"
    t.string   "name"
    t.string   "link"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "qualifications", ["id"], name: "index_qualifications_on_id", using: :btree

  create_table "subjects", id: false, force: true do |t|
    t.string  "id"
    t.string  "title"
    t.string  "link"
    t.string  "colour"
    t.integer "qualification_id"
  end

  add_index "subjects", ["id"], name: "index_subjects_on_id", using: :btree

end
