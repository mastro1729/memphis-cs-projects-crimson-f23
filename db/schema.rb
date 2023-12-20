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

ActiveRecord::Schema[7.0].define(version: 2023_12_09_084047) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "candles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "color"
    t.string "size"
    t.string "fragrance"
    t.string "wax_type"
    t.string "pet_type"
    t.string "silhouette"
    t.string "design_style"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "candle_id"
    t.bigint "customer_id"
    t.bigint "order_id"
    t.index ["candle_id"], name: "index_cart_items_on_candle_id"
    t.index ["customer_id"], name: "index_cart_items_on_customer_id"
    t.index ["order_id"], name: "index_cart_items_on_order_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "global_rewards", force: :cascade do |t|
    t.integer "reward_points_remaining"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_global_rewards_on_customer_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "vendor_id"
    t.bigint "candle_id"
    t.index ["candle_id"], name: "index_inventories_on_candle_id"
    t.index ["vendor_id"], name: "index_inventories_on_vendor_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "status"
    t.integer "order_reward"
    t.boolean "is_payment_done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.bigint "payment_detail_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["payment_detail_id"], name: "index_orders_on_payment_detail_id"
  end

  create_table "payment_details", force: :cascade do |t|
    t.string "card_no"
    t.string "card_type"
    t.date "exp"
    t.string "cvv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_payment_details_on_customer_id"
  end

  create_table "purchase_histories", force: :cascade do |t|
    t.string "candle_name"
    t.string "candle_desc"
    t.string "candle_pet_type"
    t.integer "candle_price"
    t.integer "candle_quantity"
    t.string "payment_card_no"
    t.string "payment_card_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.index ["order_id"], name: "index_purchase_histories_on_order_id"
  end

  create_table "reminders", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.boolean "status", default: false
    t.index ["customer_id"], name: "index_reminders_on_customer_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_vendors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_vendors_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cart_items", "candles"
  add_foreign_key "cart_items", "customers"
  add_foreign_key "cart_items", "orders"
  add_foreign_key "global_rewards", "customers"
  add_foreign_key "inventories", "candles"
  add_foreign_key "inventories", "vendors"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "payment_details"
  add_foreign_key "payment_details", "customers"
  add_foreign_key "purchase_histories", "orders"
  add_foreign_key "reminders", "customers"
end
