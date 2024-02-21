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

ActiveRecord::Schema.define(version: 20180725085629) do

  create_table "labels", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "note_labels", force: :cascade do |t|
    t.integer  "note_id",    limit: 4
    t.integer  "label_id",   limit: 4
    t.string   "summary",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "note_labels", ["note_id", "label_id"], name: "index_note_labels_on_note_id_and_label_id", using: :btree

  create_table "notes", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "title",      limit: 255,   null: false
    t.text     "text",       limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "notes", ["user_id"], name: "index_notes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 100, null: false
    t.string   "username",        limit: 255, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest", limit: 255
  end

  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
