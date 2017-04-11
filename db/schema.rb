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

ActiveRecord::Schema.define(version: 20170411233633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "descriptions", force: :cascade do |t|
    t.text     "text"
    t.integer  "tweak_id"
    t.integer  "upvotes",    default: 0
    t.integer  "downvotes",  default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["tweak_id"], name: "index_descriptions_on_tweak_id", using: :btree
  end

  create_table "titles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.index ["category_id"], name: "index_titles_on_category_id", using: :btree
  end

  create_table "tweaks", force: :cascade do |t|
    t.string   "name"
    t.integer  "title_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title_id"], name: "index_tweaks_on_title_id", using: :btree
  end

  add_foreign_key "descriptions", "tweaks"
  add_foreign_key "tweaks", "titles"
end
