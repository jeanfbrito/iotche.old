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

ActiveRecord::Schema.define(version: 2018_09_02_002447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "devices", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "write_key"
    t.string "read_key"
  end

  create_table "feeds", force: :cascade do |t|
    t.bigint "device_id"
    t.string "grouping_type"
    t.integer "grouping_interval"
    t.string "metric_type"
    t.string "name"
    t.string "grouping_field"
    t.string "metric_field"
    t.string "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_feeds_on_device_id"
  end

  create_table "readings", force: :cascade do |t|
    t.string "device_uid"
    t.datetime "datetime"
    t.jsonb "data"
    t.bigint "device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_readings_on_device_id"
  end

  add_foreign_key "feeds", "devices"
  add_foreign_key "readings", "devices"
end
