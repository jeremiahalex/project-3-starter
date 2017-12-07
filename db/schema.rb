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

ActiveRecord::Schema.define(version: 20171116072405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "clothes_set_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clothes_set_id"], name: "index_cart_items_on_clothes_set_id"
    t.index ["user_id"], name: "index_cart_items_on_user_id"
  end

  create_table "children", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.date "birthday"
    t.bigint "size_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["size_id"], name: "index_children_on_size_id"
    t.index ["user_id"], name: "index_children_on_user_id"
  end

  create_table "clothes_sets", force: :cascade do |t|
    t.string "name"
    t.bigint "style_id"
    t.bigint "size_id"
    t.bigint "stock_status_id"
    t.string "photo_URL"
    t.integer "points", default: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gender"
    t.index ["size_id"], name: "index_clothes_sets_on_size_id"
    t.index ["stock_status_id"], name: "index_clothes_sets_on_stock_status_id"
    t.index ["style_id"], name: "index_clothes_sets_on_style_id"
  end

  create_table "loan_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loaned_items", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "clothes_set_id"
    t.bigint "loan_status_id"
    t.date "date_of_submission"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clothes_set_id"], name: "index_loaned_items_on_clothes_set_id"
    t.index ["loan_status_id"], name: "index_loaned_items_on_loan_status_id"
    t.index ["user_id"], name: "index_loaned_items_on_user_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stock_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "admin", default: false
    t.integer "points", default: 0
    t.boolean "subscription_type", default: false
    t.integer "phone"
    t.string "street", null: false
    t.string "unit", null: false
    t.string "postalcode", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cart_items", "clothes_sets"
  add_foreign_key "cart_items", "users"
  add_foreign_key "children", "sizes"
  add_foreign_key "children", "users"
  add_foreign_key "clothes_sets", "sizes"
  add_foreign_key "clothes_sets", "stock_statuses"
  add_foreign_key "clothes_sets", "styles"
  add_foreign_key "loaned_items", "clothes_sets"
  add_foreign_key "loaned_items", "loan_statuses"
  add_foreign_key "loaned_items", "users"
end
