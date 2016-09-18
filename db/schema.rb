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

ActiveRecord::Schema.define(version: 20160917130713) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mainprojects", force: :cascade do |t|
    t.string   "company"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "attachment"
  end

  add_index "mainprojects", ["user_id"], name: "index_mainprojects_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "description"
    t.string   "messtype"
    t.text     "receivers"
    t.integer  "mainproject_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "title"
  end

  add_index "messages", ["mainproject_id"], name: "index_messages_on_mainproject_id", using: :btree

  create_table "milestones", force: :cascade do |t|
    t.string   "milestone"
    t.date     "duedate"
    t.integer  "mainproject_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "attachment"
    t.string   "projtype"
  end

  add_index "milestones", ["mainproject_id"], name: "index_milestones_on_mainproject_id", using: :btree
  add_index "milestones", ["user_id"], name: "index_milestones_on_user_id", using: :btree

  create_table "stakeholders", force: :cascade do |t|
    t.string   "name"
    t.string   "jobtitle"
    t.string   "busarea"
    t.integer  "mainproject_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "stakeholders", ["mainproject_id"], name: "index_stakeholders_on_mainproject_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "mainprojects", "users"
  add_foreign_key "messages", "mainprojects"
  add_foreign_key "milestones", "mainprojects"
  add_foreign_key "milestones", "users"
  add_foreign_key "stakeholders", "mainprojects"
end
