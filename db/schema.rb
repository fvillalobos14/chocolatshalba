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

ActiveRecord::Schema.define(version: 20180823022047) do

  create_table "acceptances", force: :cascade do |t|
    t.decimal "max_qualityA"
    t.decimal "max_qualityB"
    t.decimal "max_qualityC"
    t.decimal "min_qualityA"
    t.decimal "min_qualityB"
    t.decimal "min_qualityC"
    t.integer "parameter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parameter_id"], name: "index_acceptances_on_parameter_id"
  end

  create_table "archives", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "batches", force: :cascade do |t|
    t.integer "sackAmount"
    t.decimal "weight"
    t.string "enterCode"
    t.integer "cocoaType"
    t.integer "geneticMaterial"
    t.boolean "moved", default: false
    t.boolean "ft"
    t.integer "review", default: 0
    t.integer "buy", default: 0
    t.integer "entry_control_id"
    t.integer "export_batch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "certificatetype"
    t.integer "postharvestCenter"
    t.integer "entrySheetNumber"
    t.integer "organizationId"
    t.string "receivedBy"
    t.string "deliveredBy"
    t.integer "samples"
    t.index ["entry_control_id"], name: "index_batches_on_entry_control_id"
  end

  create_table "bills", force: :cascade do |t|
    t.integer "code"
    t.integer "invoice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invoice_doc_file_name"
    t.string "invoice_doc_content_type"
    t.integer "invoice_doc_file_size"
    t.datetime "invoice_doc_updated_at"
    t.index ["invoice_id"], name: "index_bills_on_invoice_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "place"
    t.integer "runs"
    t.boolean "sensory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certificate_checks", force: :cascade do |t|
    t.integer "decision"
    t.text "description"
    t.integer "batch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_certificate_checks_on_batch_id"
  end

  create_table "certificate_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "checkings", force: :cascade do |t|
    t.integer "batch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_checkings_on_batch_id"
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

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.integer "entry_control_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ec_data_file_name"
    t.string "ec_data_content_type"
    t.integer "ec_data_file_size"
    t.datetime "ec_data_updated_at"
    t.index ["entry_control_id"], name: "index_documents_on_entry_control_id"
  end

  create_table "entry_controls", force: :cascade do |t|
    t.date "entryDate"
    t.decimal "exchangeRate"
    t.string "receivedBy"
    t.string "deliveredBy"
    t.integer "entry_number"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ec_files_file_name"
    t.string "ec_files_content_type"
    t.integer "ec_files_file_size"
    t.datetime "ec_files_updated_at"
    t.index ["organization_id"], name: "index_entry_controls_on_organization_id"
  end

  create_table "export_batches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "filechecklists", force: :cascade do |t|
    t.boolean "referralSheet"
    t.boolean "producersList"
    t.boolean "inspectionSheet"
    t.boolean "embacingControl"
    t.boolean "collectionCleaningControl"
    t.boolean "warehouseEntrySheet"
    t.integer "entry_control_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "everything"
    t.boolean "billCopy"
    t.index ["entry_control_id"], name: "index_filechecklists_on_entry_control_id"
  end

  create_table "genetic_materials", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.boolean "paid"
    t.integer "batch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_invoices_on_batch_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.boolean "read"
    t.integer "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parameters", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.integer "place"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_parameters_on_category_id"
  end

  create_table "prices", force: :cascade do |t|
    t.decimal "price"
    t.integer "cocoa_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cocoa_type_id"], name: "index_prices_on_cocoa_type_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "decision"
    t.integer "batch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_purchases_on_batch_id"
  end

  create_table "quality_controls", force: :cascade do |t|
    t.integer "code"
    t.string "final_code"
    t.date "cut_at"
    t.boolean "f_harvest"
    t.boolean "s_harvest"
    t.boolean "trinitary"
    t.boolean "outsider"
    t.string "observation"
    t.string "made_by"
    t.integer "batch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_quality_controls_on_batch_id"
  end

  create_table "results", force: :cascade do |t|
    t.decimal "score"
    t.integer "run"
    t.integer "parameter_id"
    t.integer "batch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_results_on_batch_id"
    t.index ["parameter_id"], name: "index_results_on_parameter_id"
  end

  create_table "revisions", force: :cascade do |t|
    t.integer "status"
    t.integer "quality_control_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quality_control_id"], name: "index_revisions_on_quality_control_id"
  end

  create_table "sensory_analyses", force: :cascade do |t|
    t.string "observation"
    t.string "made_by"
    t.integer "batch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "samples"
    t.index ["batch_id"], name: "index_sensory_analyses_on_batch_id"
  end

  create_table "sequences", force: :cascade do |t|
    t.integer "number"
    t.integer "year"
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
    t.boolean "purchase_role", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
