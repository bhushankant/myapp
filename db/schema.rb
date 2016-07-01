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

ActiveRecord::Schema.define(version: 20160630123654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competition_results", force: :cascade do |t|
    t.integer  "sporter_id"
    t.integer  "competition_id"
    t.integer  "place"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "competition_results", ["competition_id"], name: "index_competition_results_on_competition_id", using: :btree
  add_index "competition_results", ["sporter_id"], name: "index_competition_results_on_sporter_id", using: :btree

  create_table "competitions", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "cover"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
  end

  create_table "herks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "high_scores", force: :cascade do |t|
    t.string   "game"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "file_avatar_file_name"
    t.string   "file_avatar_content_type"
    t.integer  "file_avatar_file_size"
    t.datetime "file_avatar_updated_at"
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "description"
    t.string   "image"
    t.integer  "gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gallery_token"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "quantity"
    t.decimal  "price",      precision: 12, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "rates", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sporters", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sporters", ["country_id"], name: "index_sporters_on_country_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                    default: "", null: false
    t.string   "encrypted_password",       default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "authentication_token"
    t.string   "provider"
    t.string   "uid"
    t.string   "avatar"
    t.string   "file_avatar_file_name"
    t.string   "file_avatar_content_type"
    t.integer  "file_avatar_file_size"
    t.datetime "file_avatar_updated_at"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "competition_results", "competitions"
  add_foreign_key "competition_results", "sporters"
  add_foreign_key "sporters", "countries"
end
