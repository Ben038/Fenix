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

ActiveRecord::Schema.define(version: 2019_11_12_152007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounting_data", force: :cascade do |t|
    t.integer "balance_year"
    t.string "local_insurer"
    t.string "geo_area"
    t.string "country"
    t.string "product"
    t.string "business_division"
    t.string "local_client"
    t.string "reinsurance_network"
    t.string "risk"
    t.string "policy_number"
    t.string "benefit"
    t.date "effective_date"
    t.date "cancellation_date"
    t.float "premium"
    t.float "earned_premium"
    t.float "premium_and_reserves_change"
    t.float "claim_paid"
    t.float "claim_paid_and_reserves_change"
    t.float "reinsurance_comm"
    t.integer "broker_comm"
    t.float "profit_sharing"
    t.float "taxes"
    t.float "interests"
    t.float "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "file_upload_id"
    t.bigint "international_client_id"
    t.integer "quarter"
    t.index ["file_upload_id"], name: "index_accounting_data_on_file_upload_id"
  end

  create_table "file_uploads", force: :cascade do |t|
    t.string "reinsurance_network"
    t.string "file_name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "balance_year"
    t.integer "quarter"
    t.index ["user_id"], name: "index_file_uploads_on_user_id"
  end

  create_table "international_clients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "profile_picture"
    t.bigint "international_client_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["international_client_id"], name: "index_users_on_international_client_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounting_data", "file_uploads"
  add_foreign_key "accounting_data", "international_clients"
  add_foreign_key "accounting_data", "users"
  add_foreign_key "file_uploads", "users"
  add_foreign_key "users", "international_clients"
end
