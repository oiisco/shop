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

ActiveRecord::Schema.define(version: 20180916184525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "city"
    t.string "zip_code"
    t.string "street"
    t.string "email"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_addresses_on_order_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "unit_price"
    t.integer "quantity"
    t.bigint "order_id"
    t.string "item_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.text "comment"
    t.bigint "shipping_type_id"
    t.decimal "shipping_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipping_type_id"], name: "index_orders_on_shipping_type_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "long_description"
    t.string "photo"
    t.integer "price"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "shipping_types", force: :cascade do |t|
    t.string "name"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "orders"
  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "products"
  add_foreign_key "orders", "shipping_types"
  add_foreign_key "products", "categories"
end
