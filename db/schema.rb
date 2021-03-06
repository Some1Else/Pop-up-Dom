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

ActiveRecord::Schema.define(version: 20140204191651) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "role_sl"
    t.string   "address"
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "role_en"
  end

  create_table "event_categories", force: true do |t|
    t.string   "name_sl"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name_en"
    t.string   "name_it"
  end

  create_table "event_images", force: true do |t|
    t.string   "file"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "event_images", ["event_id"], name: "index_event_images_on_event_id"

  create_table "event_occurances", force: true do |t|
    t.datetime "begins_at"
    t.datetime "ends_at"
    t.boolean  "duration_important", default: false
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_occurances", ["event_id"], name: "index_event_occurances_on_event_id"

  create_table "events", force: true do |t|
    t.string   "name_sl"
    t.text     "description_sl"
    t.integer  "event_category_id"
    t.datetime "begins_at"
    t.decimal  "price",                     precision: 8, scale: 2
    t.integer  "tickets"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "open_for_reservation",                              default: false
    t.string   "reservation_email",                                 default: "info@popupdom.si"
    t.string   "reservation_email_subject",                         default: ""
    t.boolean  "exposed",                                           default: false
    t.text     "additional_description_sl",                         default: ""
    t.string   "reservation_email_body",                            default: ""
    t.string   "name_en"
    t.text     "description_en"
    t.text     "additional_description_en",                         default: ""
    t.string   "name_it"
    t.text     "description_it"
    t.text     "additional_description_it",                         default: ""
    t.boolean  "archived",                                          default: false
  end

  add_index "events", ["event_category_id"], name: "index_events_on_event_category_id"

  create_table "gallery_images", force: true do |t|
    t.string   "file"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participants", force: true do |t|
    t.string   "first_name"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_name"
  end

  create_table "partners", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file"
  end

  create_table "product_authors", force: true do |t|
    t.string   "name"
    t.text     "description_sl"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description_en"
  end

  create_table "product_categories", force: true do |t|
    t.string   "name_sl"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name_en"
  end

  create_table "product_images", force: true do |t|
    t.string   "file"
    t.integer  "product_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_images", ["product_id"], name: "index_product_images_on_product_id"

  create_table "products", force: true do |t|
    t.string   "name_sl"
    t.text     "description_sl"
    t.integer  "product_author_id"
    t.integer  "product_category_id"
    t.decimal  "price",               precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published",                                   default: false
    t.string   "name_en"
    t.text     "description_en"
  end

  add_index "products", ["product_author_id"], name: "index_products_on_product_author_id"
  add_index "products", ["product_category_id"], name: "index_products_on_product_category_id"

  create_table "sponsors", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file"
  end

end
