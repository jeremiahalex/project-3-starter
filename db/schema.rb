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

ActiveRecord::Schema.define(version: 20171105075153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "languages", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.text "name"
    t.string "email"
    t.string "password"
    t.string "photo"
    t.string "gender"
    t.boolean "reg_tutor", default: false
    t.text "past_experience"
    t.string "github"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "skills", "languages"
  add_foreign_key "skills", "users"
  add_foreign_key "testimonials", "users", column: "author_id"
  add_foreign_key "testimonials", "users", column: "tutor_id"
end
