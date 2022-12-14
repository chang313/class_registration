# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_11_27_073051) do

  create_table "tables", force: :cascade do |t|
    t.integer "tutor_id", null: false
    t.datetime "start_time", null: false
    t.integer "active", default: 1, null: false
    t.integer "user_id", default: 0
    t.integer "duration", default: 0
    t.index ["tutor_id", "start_time"], name: "index_tables_on_tutor_id_and_start_time", unique: true
  end

  create_table "tutors", force: :cascade do |t|
    t.string "nickname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
