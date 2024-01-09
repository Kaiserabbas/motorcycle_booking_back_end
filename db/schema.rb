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

ActiveRecord::Schema[7.1].define(version: 2024_01_08_160622) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "motorcycles", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.string "chassisNumber"
    t.decimal "bookingPricePerHour"
    t.string "brand"
    t.string "model"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "imageLink"
    t.text "description"
    t.index ["chassisNumber"], name: "index_motorcycles_on_chassisNumber"
  end

  create_table "reservations", force: :cascade do |t|
    t.decimal "duration"
    t.decimal "total"
    t.bigint "user_id", null: false
    t.bigint "motorcycle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.string "city"
    t.index ["motorcycle_id"], name: "index_reservations_on_motorcycle_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin"
    t.text "token"
  end

  add_foreign_key "reservations", "motorcycles"
  add_foreign_key "reservations", "users"
end
