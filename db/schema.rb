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

ActiveRecord::Schema.define(version: 2020_03_19_033809) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.string "status"
    t.date "start_date"
    t.date "end_date"
    t.integer "total_price"
    t.bigint "flat_id"
    t.bigint "user_id"
    t.bigint "swap_request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_guests"
    t.string "checkout_session_id"
    t.integer "amount_cents", default: 0, null: false
    t.index ["flat_id"], name: "index_bookings_on_flat_id"
    t.index ["swap_request_id"], name: "index_bookings_on_swap_request_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "phone_number"
    t.string "address"
    t.string "description"
    t.bigint "flat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["flat_id"], name: "index_contacts_on_flat_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flat_perks", force: :cascade do |t|
    t.bigint "perk_id"
    t.bigint "flat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_flat_perks_on_flat_id"
    t.index ["perk_id"], name: "index_flat_perks_on_perk_id"
  end

  create_table "flats", force: :cascade do |t|
    t.string "address"
    t.boolean "swappable", default: false
    t.string "description"
    t.string "title"
    t.integer "number_of_bedrooms"
    t.float "latitude"
    t.float "longitude"
    t.integer "number_of_guests"
    t.integer "number_of_bathrooms"
    t.integer "number_of_beds"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.index ["user_id"], name: "index_flats_on_user_id"
  end

  create_table "friendships", id: :serial, force: :cascade do |t|
    t.string "friendable_type"
    t.integer "friendable_id"
    t.integer "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "blocker_id"
    t.integer "status"
    t.index ["friendable_id", "friend_id"], name: "index_friendships_on_friendable_id_and_friend_id", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "perks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "description"
    t.float "latitude"
    t.float "longitude"
    t.bigint "flat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_recommendations_on_flat_id"
  end

  create_table "swap_requests", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.bigint "requester_flat_id"
    t.bigint "requested_flat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["requested_flat_id"], name: "index_swap_requests_on_requested_flat_id"
    t.index ["requester_flat_id"], name: "index_swap_requests_on_requester_flat_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "referral_token", limit: 8
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["referral_token"], name: "index_users_on_referral_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "flats"
  add_foreign_key "bookings", "swap_requests"
  add_foreign_key "bookings", "users"
  add_foreign_key "contacts", "flats"
  add_foreign_key "flat_perks", "flats"
  add_foreign_key "flat_perks", "perks"
  add_foreign_key "flats", "users"
  add_foreign_key "recommendations", "flats"
  add_foreign_key "swap_requests", "flats", column: "requested_flat_id"
  add_foreign_key "swap_requests", "flats", column: "requester_flat_id"
end
