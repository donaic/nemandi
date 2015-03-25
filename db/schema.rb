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

ActiveRecord::Schema.define(version: 20150108224140) do

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credentials", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                limit: 4
  end

  add_index "credentials", ["confirmation_token"], name: "index_credentials_on_confirmation_token", unique: true, using: :btree
  add_index "credentials", ["email"], name: "index_credentials_on_email", unique: true, using: :btree
  add_index "credentials", ["reset_password_token"], name: "index_credentials_on_reset_password_token", unique: true, using: :btree
  add_index "credentials", ["user_id"], name: "index_credentials_on_user_id", using: :btree

  create_table "klasses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "school_id",  limit: 4
    t.integer  "status",     limit: 4
  end

  add_index "klasses", ["school_id"], name: "index_klasses_on_school_id", using: :btree

  create_table "registrations", force: :cascade do |t|
    t.integer  "rollable_id",       limit: 4
    t.string   "rollable_type",     limit: 255
    t.integer  "role",              limit: 4
    t.integer  "authorization",     limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "user_id",           limit: 4
    t.integer  "registerable_id",   limit: 4
    t.string   "registerable_type", limit: 255
  end

  add_index "registrations", ["registerable_type", "registerable_id"], name: "index_registrations_on_registerable_type_and_registerable_id", using: :btree
  add_index "registrations", ["role"], name: "index_registrations_on_role", using: :btree
  add_index "registrations", ["rollable_type", "rollable_id"], name: "index_registrations_on_rollable_type_and_rollable_id", using: :btree
  add_index "registrations", ["user_id"], name: "index_registrations_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "authorization", limit: 4
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",   limit: 255
    t.string   "last_name",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "middle_name",  limit: 255
    t.string   "address",      limit: 255
    t.string   "phone_number", limit: 255
  end

  add_foreign_key "credentials", "users"
  add_foreign_key "registrations", "users"
end
