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

ActiveRecord::Schema.define(version: 20150823202504) do

  create_table "abilities", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.text     "description",        limit: 65535
    t.integer  "heroe_id",           limit: 4
    t.boolean  "active",             limit: 1
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "abilities", ["heroe_id"], name: "index_abilities_on_heroe_id", using: :btree

  create_table "attachment_sets", force: :cascade do |t|
    t.integer  "heroe_set_id",       limit: 4
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachment_sets", ["heroe_set_id"], name: "index_attachment_sets_on_heroe_set_id", using: :btree

  create_table "attachments", force: :cascade do |t|
    t.integer  "heroe_set_id",       limit: 4
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["heroe_set_id"], name: "index_attachments_on_heroe_set_id", using: :btree

  create_table "heroe_sets", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.string   "rarity",      limit: 255
    t.boolean  "active",      limit: 1
    t.integer  "heroe_id",    limit: 4
    t.decimal  "cost",                      precision: 10, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "heroe_sets", ["heroe_id"], name: "index_heroe_sets_on_heroe_id", using: :btree

  create_table "heroeattributes", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.text     "description",        limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "heroes", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "description",        limit: 65535
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.string   "video",              limit: 255
    t.integer  "heroeattribute_id",  limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "heroes", ["heroeattribute_id"], name: "index_heroes_on_heroeattribute_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.text     "description",        limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "username",               limit: 255
    t.boolean  "is_admin",               limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
