# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131028122649) do

  create_table "drugs", force: true do |t|
    t.string   "generic_name"
    t.string   "strength"
    t.string   "brand_name"
    t.string   "purpose"
    t.string   "am_check"
    t.string   "am_time"
    t.string   "noon_check"
    t.string   "noon_time"
    t.string   "supper_check"
    t.string   "supper_time"
    t.string   "bedtime_check"
    t.string   "bedtime_time"
    t.integer  "drugable_id"
    t.string   "drugable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "drugs", ["drugable_id", "drugable_type"], name: "drugable_index"
  add_index "drugs", ["id"], name: "index_drugs_on_id", unique: true

  create_table "instructions", force: true do |t|
    t.string   "line"
    t.integer  "drug_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "instructions", ["drug_id"], name: "index_instructions_on_drug_id"
  add_index "instructions", ["id"], name: "index_instructions_on_id", unique: true

  create_table "patients", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mrn"
    t.date     "date_of_birth"
    t.string   "program"
    t.datetime "admission_date"
    t.datetime "discharge_date"
    t.integer  "pharmacist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patients", ["id"], name: "index_patients_on_id", unique: true
  add_index "patients", ["mrn"], name: "index_patients_on_mrn", unique: true
  add_index "patients", ["pharmacist_id"], name: "index_patients_on_pharmacist_id"
  add_index "patients", ["program"], name: "index_patients_on_program"

  create_table "pharmacists", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "pharmacists", ["email"], name: "index_pharmacists_on_email", unique: true
  add_index "pharmacists", ["id"], name: "index_pharmacists_on_id"
  add_index "pharmacists", ["reset_password_token"], name: "index_pharmacists_on_reset_password_token", unique: true

  create_table "prescriptions", force: true do |t|
    t.integer  "patient_id"
    t.integer  "pharmacist_id"
    t.string   "physician"
    t.integer  "base_template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prescriptions", ["base_template_id"], name: "index_prescriptions_on_base_template_id"
  add_index "prescriptions", ["id"], name: "index_prescriptions_on_id", unique: true
  add_index "prescriptions", ["patient_id"], name: "index_prescriptions_on_patient_id"
  add_index "prescriptions", ["pharmacist_id"], name: "index_prescriptions_on_pharmacist_id"
  add_index "prescriptions", ["physician"], name: "index_prescriptions_on_physician"

  create_table "templates", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "templates", ["id"], name: "index_templates_on_id", unique: true

end
