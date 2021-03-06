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

ActiveRecord::Schema.define(version: 20171019145854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "children", force: :cascade do |t|
    t.string  "name"
    t.date    "birth_day"
    t.integer "user_id"
  end

  add_index "children", ["user_id"], name: "index_children_on_user_id", using: :btree

  create_table "contexts", force: :cascade do |t|
    t.text     "aboutDescription"
    t.string   "aboutPicture"
    t.string   "aboutVideo"
    t.string   "coverPicture"
    t.string   "parallaxPicture"
    t.integer  "user_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "coverPicture_file_name"
    t.string   "coverPicture_content_type"
    t.integer  "coverPicture_file_size"
    t.datetime "coverPicture_updated_at"
    t.string   "aboutPicture_file_name"
    t.string   "aboutPicture_content_type"
    t.integer  "aboutPicture_file_size"
    t.datetime "aboutPicture_updated_at"
    t.string   "parallaxPicture_file_name"
    t.string   "parallaxPicture_content_type"
    t.integer  "parallaxPicture_file_size"
    t.datetime "parallaxPicture_updated_at"
  end

  add_index "contexts", ["user_id"], name: "index_contexts_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "stories", force: :cascade do |t|
    t.string   "name"
    t.json     "tag"
    t.date     "date"
    t.string   "image"
    t.string   "teller_title"
    t.integer  "teller_id"
    t.integer  "child_id"
    t.integer  "user_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "stories", ["child_id"], name: "index_stories_on_child_id", using: :btree
  add_index "stories", ["user_id"], name: "index_stories_on_user_id", using: :btree

  create_table "tellers", force: :cascade do |t|
    t.integer "user_teller_id"
    t.string  "title"
    t.integer "user_id"
    t.integer "child_id"
    t.integer "story_id"
  end

  add_index "tellers", ["child_id"], name: "index_tellers_on_child_id", using: :btree
  add_index "tellers", ["story_id"], name: "index_tellers_on_story_id", using: :btree
  add_index "tellers", ["user_id"], name: "index_tellers_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "children", "users"
  add_foreign_key "tellers", "children"
  add_foreign_key "tellers", "stories"
  add_foreign_key "tellers", "users"
end
