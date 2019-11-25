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

ActiveRecord::Schema.define(version: 2019_11_19_070411) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "arrivals", force: :cascade do |t|
    t.integer "product_id"
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_arrivals_on_product_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "product_id"
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_cart_items_on_customer_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: ""
    t.string "encrypted_password", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name_first"
    t.string "name_last"
    t.string "name_first_kana"
    t.string "name_last_kana"
    t.string "phone_number"
    t.boolean "is_deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["name_first", "name_last"], name: "index_customers_on_name_first_and_name_last"
    t.index ["name_first_kana", "name_last_kana"], name: "index_customers_on_name_first_kana_and_name_last_kana"
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "destinations", force: :cascade do |t|
    t.integer "customer_id"
    t.string "name"
    t.string "postal_code"
    t.integer "address_prefecture", null: false
    t.string "address_city", null: false
    t.string "address_after", null: false
    t.boolean "is_main", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_destinations_on_customer_id"
  end

  create_table "discs", force: :cascade do |t|
    t.integer "product_id"
    t.integer "order", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_discs_on_product_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_favorites_on_customer_id"
    t.index ["product_id"], name: "index_favorites_on_product_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "shipping_status", null: false
    t.integer "payment", null: false
    t.integer "shipping_fee", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "reciever", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "orders_details", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.integer "price", null: false
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_orders_details_on_order_id"
    t.index ["product_id"], name: "index_orders_details_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "artist_id"
    t.integer "label_id"
    t.integer "genre_id"
    t.string "name", null: false
    t.integer "price", null: false
    t.integer "stock", default: 0, null: false
    t.integer "sales", default: 0, null: false
    t.date "released_at", null: false
    t.boolean "on_sale", default: true, null: false
    t.boolean "is_deleted", default: true, null: false
    t.string "product_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_products_on_artist_id"
    t.index ["genre_id"], name: "index_products_on_genre_id"
    t.index ["label_id"], name: "index_products_on_label_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "product_id"
    t.string "title", null: false
    t.integer "rank", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_reviews_on_customer_id"
    t.index ["product_id"], name: "index_reviews_on_product_id"
  end

  create_table "songs", force: :cascade do |t|
    t.integer "disc_id"
    t.integer "order", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disc_id"], name: "index_songs_on_disc_id"
  end

end
