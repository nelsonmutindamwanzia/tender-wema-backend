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

ActiveRecord::Schema[7.0].define(version: 2023_01_18_171559) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "proposal_scores", force: :cascade do |t|
    t.integer "quality"
    t.integer "maintenance"
    t.integer "completion_period"
    t.integer "price"
    t.integer "proposal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tender_id"
    t.integer "supplier_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "kra_pin"
    t.text "company_license"
    t.text "bank_statements"
    t.text "tax_compliance"
    t.text "council_registration"
    t.integer "proposal_amount"
    t.boolean "status"
    t.integer "supplier_id"
    t.integer "tender_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "company_name"
    t.string "company_address"
    t.string "company_telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenderers", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenders", force: :cascade do |t|
    t.string "tender_name"
    t.string "tender_category"
    t.string "tender_description"
    t.datetime "timeline"
    t.datetime "application_deadline"
    t.integer "budget"
    t.integer "tenderer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
