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

ActiveRecord::Schema[7.1].define(version: 2024_02_10_201201) do
  create_table "earnings", force: :cascade do |t|
    t.integer "wallets_id", null: false
    t.decimal "value", precision: 10, scale: 2, default: "0.0"
    t.datetime "earning_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "description"
    t.integer "status", default: 0, null: false
    t.integer "kind", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wallets_id"], name: "index_earnings_on_wallets_id"
  end

  create_table "refunds", force: :cascade do |t|
    t.integer "wallet_id", null: false
    t.decimal "value", precision: 10, scale: 2, default: "0.0"
    t.datetime "refund_date", null: false
    t.string "description", null: false
    t.integer "status", default: 0, null: false
    t.integer "kind", default: 0, null: false
    t.integer "refund_origin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wallet_id"], name: "index_refunds_on_wallet_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "user_id", null: false
    t.decimal "balance", precision: 10, scale: 2, default: "0.0"
    t.string "currency", default: "BRL", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "earnings", "wallets", column: "wallets_id"
  add_foreign_key "refunds", "refunds", column: "refund_origin_id"
  add_foreign_key "refunds", "wallets"
  add_foreign_key "wallets", "users"
end
