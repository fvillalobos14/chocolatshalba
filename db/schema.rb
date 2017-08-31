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

ActiveRecord::Schema.define(version: 20170830232132) do

  create_table "batches", force: :cascade do |t|
    t.integer "sackAmount"
    t.decimal "weight"
    t.string "enterCode"
    t.integer "cocoaType"
    t.integer "geneticMaterial"
    t.integer "entry_control_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_control_id"], name: "index_batches_on_entry_control_id"
  end

  create_table "cocoa_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collection_centers", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_collection_centers_on_organization_id"
  end

  create_table "entry_controls", force: :cascade do |t|
    t.date "entryDate"
    t.decimal "exchangeRate"
    t.string "receivedBy"
    t.string "deliveredBy"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_entry_controls_on_organization_id"
  end

  create_table "genetic_materials", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "code"
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
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "warehouse_role", default: false
    t.boolean "admin_role", default: false
    t.boolean "quality_manager_role", default: false
    t.boolean "certification_role", default: false
    t.boolean "quality_role", default: false
    t.boolean "administration_role", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
