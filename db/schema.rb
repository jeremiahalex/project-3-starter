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

ActiveRecord::Schema.define(version: 20180125085019) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.boolean "is_admin", default: false, null: false
    t.string "provider"
    t.string "uid"
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_accounts_on_confirmation_token", unique: true
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.string "model_no"
    t.string "serial_no"
    t.integer "warranty_in_months"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.date "date_created"
    t.string "title"
    t.text "body"
    t.boolean "is_resolved"
    t.date "date_resolved"
    t.bigint "customer_id"
    t.bigint "warranty_id"
    t.bigint "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_tickets_on_customer_id"
    t.index ["staff_id"], name: "index_tickets_on_staff_id"
    t.index ["warranty_id"], name: "index_tickets_on_warranty_id"
  end

  create_table "warranties", force: :cascade do |t|
    t.date "date_of_purchase"
    t.bigint "customer_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_warranties_on_customer_id"
    t.index ["product_id"], name: "index_warranties_on_product_id"
  end

  add_foreign_key "tickets", "accounts", column: "customer_id"
  add_foreign_key "tickets", "accounts", column: "staff_id"
  add_foreign_key "tickets", "warranties"
  add_foreign_key "warranties", "accounts", column: "customer_id"
  add_foreign_key "warranties", "products"
end
