# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_01_11_144521) do

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", primary_key: "c_id", id: :string, force: :cascade do |t|
    t.string "c_name"
    t.string "teacher_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.string "roll_no"
    t.string "c_id"
    t.string "marks"
  end

  create_table "logins", force: :cascade do |t|
    t.string "username"
    t.string "password"
  end

  create_table "students", primary_key: "roll_no", id: :string, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
  end

  create_table "teachers", primary_key: "emp_id", id: :string, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
  end

  create_table "userdetails", force: :cascade do |t|
    t.string "email"
    t.string "password"
  end

  add_foreign_key "courses", "teachers", primary_key: "emp_id"
  add_foreign_key "enrollments", "courses", column: "c_id", primary_key: "c_id"
  add_foreign_key "enrollments", "students", column: "roll_no", primary_key: "roll_no"
end
