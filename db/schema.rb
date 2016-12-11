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

ActiveRecord::Schema.define(version: 20151001044043) do

  create_table "designers", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "designers", ["email"], name: "index_designers_on_email", unique: true

  create_table "icon_sets", force: :cascade do |t|
    t.integer  "user_id",         null: false
    t.integer  "designer_id",     null: false
    t.string   "name",            null: false
    t.string   "slug",            null: false
    t.integer  "designed_for",    null: false
    t.string   "css_prefix",      null: false
    t.string   "icon_css_prefix", null: false
    t.string   "website"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "icon_sets", ["designer_id"], name: "index_icon_sets_on_designer_id"
  add_index "icon_sets", ["user_id", "name"], name: "index_icon_sets_on_user_id_and_name", unique: true
  add_index "icon_sets", ["user_id", "slug"], name: "index_icon_sets_on_user_id_and_slug", unique: true
  add_index "icon_sets", ["user_id"], name: "index_icon_sets_on_user_id"

  create_table "icons", force: :cascade do |t|
    t.integer  "icon_set_id", null: false
    t.string   "name",        null: false
    t.integer  "unicode",     null: false
    t.text     "svg",         null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "icons", ["icon_set_id", "name"], name: "index_icons_on_icon_set_id_and_name", unique: true
  add_index "icons", ["icon_set_id", "unicode"], name: "index_icons_on_icon_set_id_and_unicode", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "name",                                null: false
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
