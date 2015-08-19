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

ActiveRecord::Schema.define(version: 20150819064212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "blasts", force: :cascade do |t|
    t.text     "content"
    t.integer  "ownable_id"
    t.string   "ownable_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "event_id"
  end

  add_index "blasts", ["ownable_type", "ownable_id"], name: "index_blasts_on_ownable_type_and_ownable_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.hstore   "details",    default: {}, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "number"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversations", ["recipient_id"], name: "index_conversations_on_recipient_id", using: :btree
  add_index "conversations", ["sender_id"], name: "index_conversations_on_sender_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.datetime "date"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "conversation_id"
    t.integer  "contact_id"
    t.string   "body"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "number_id"
  end

  create_table "numbers", force: :cascade do |t|
    t.integer  "ownable_id"
    t.string   "ownable_type"
    t.string   "number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "numbers", ["ownable_type", "ownable_id"], name: "index_numbers_on_ownable_type_and_ownable_id", using: :btree

  create_table "responses", force: :cascade do |t|
    t.string   "value"
    t.integer  "number_id"
    t.integer  "blast_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
