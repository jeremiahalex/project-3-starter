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

ActiveRecord::Schema.define(version: 20171107061146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_bookings_on_session_id"
    t.index ["student_id"], name: "index_bookings_on_student_id"
  end

  create_table "languages", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "datetime"
    t.bigint "tutor_id"
    t.integer "duration"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tutor_id"], name: "index_sessions_on_tutor_id"
  end

  create_table "skills", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_skills_on_language_id"
    t.index ["user_id"], name: "index_skills_on_user_id"
  end

  create_table "testimonials", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "tutor_id"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_testimonials_on_author_id"
    t.index ["tutor_id"], name: "index_testimonials_on_tutor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "photo"
    t.string "gender"
    t.boolean "reg_tutor", default: false
    t.text "past_experience"
    t.string "github"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "sessions"
  add_foreign_key "bookings", "users", column: "student_id"
  add_foreign_key "sessions", "users", column: "tutor_id"
  add_foreign_key "skills", "languages"
  add_foreign_key "skills", "users"
  add_foreign_key "testimonials", "users", column: "author_id"
  add_foreign_key "testimonials", "users", column: "tutor_id"
end
