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

ActiveRecord::Schema.define(version: 20170903194512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "payment_methods", force: :cascade do |t|
    t.bigint "user_id"
    t.string "card_token"
    t.string "card_last_four"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payment_methods_on_user_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "day_of_week"
    t.time "time"
    t.integer "price"
    t.bigint "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.index ["venue_id"], name: "index_promotions_on_venue_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "payment_method_id"
    t.bigint "promotion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_code"
    t.boolean "active", default: true
    t.index ["payment_method_id"], name: "index_transactions_on_payment_method_id"
    t.index ["promotion_id"], name: "index_transactions_on_promotion_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "provider"
    t.string "uid"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.text "description"
    t.index ["email"], name: "index_venues_on_email", unique: true
  end

  add_foreign_key "payment_methods", "users"
  add_foreign_key "promotions", "venues"
  add_foreign_key "transactions", "payment_methods"
  add_foreign_key "transactions", "promotions"
end
