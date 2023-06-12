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

ActiveRecord::Schema[6.1].define(version: 20210324123644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_items", force: :cascade do |t|
    t.integer  "finding_id"
    t.integer  "user_id"
    t.datetime "due_date"
    t.text     "description"
    t.text     "comments"
    t.string   "comments_disposition"
    t.datetime "requested_date"
    t.datetime "completed_date"
    t.datetime "status_date"
    t.string   "status"
  end

  create_table "categories", force: :cascade do |t|
    t.string "code",      null: false
    t.string "name",      null: false
    t.string "ancestry"
    t.string "framework"
    t.string "primary"
    t.index ["ancestry"], name: "index_categories_on_ancestry", using: :btree
    t.index ["code", "name", "ancestry"], name: "index_categories_on_code_and_name", unique: true, using: :btree
  end

  create_table "category_score_ranges", force: :cascade do |t|
    t.integer "category_id",    null: false
    t.integer "score_range_id", null: false
    t.text    "description"
    t.index ["category_id", "score_range_id"], name: "index_category_score_ranges_on_category_id_and_score_range_id", unique: true, using: :btree
  end

  create_table "certification_types", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_certification_types_on_name", unique: true, using: :btree
  end

  create_table "customer_categories", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "category_id", null: false
  end

  create_table "customer_templates", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "template_id", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name",                                      null: false
    t.boolean  "is_enabled",                default: true,  null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "address"
    t.string   "registration_num"
    t.string   "contact_main_name"
    t.string   "contact_main_title"
    t.string   "contact_main_address"
    t.string   "contact_main_phone"
    t.string   "contact_main_email"
    t.string   "contact_billing_name"
    t.string   "contact_billing_title"
    t.string   "contact_billing_address"
    t.string   "contact_billing_phone"
    t.string   "contact_billing_email"
    t.string   "contact_technical_name"
    t.string   "contact_technical_title"
    t.string   "contact_technical_address"
    t.string   "contact_technical_phone"
    t.string   "contact_technical_email"
    t.string   "logo_url"
    t.string   "color_primary"
    t.string   "color_secondary"
    t.string   "color_light"
    t.string   "color_dark"
    t.text     "tier"
    t.integer  "max_projects",              default: 1
    t.integer  "max_reviews",               default: 1
    t.integer  "max_frameworks",            default: 1
    t.boolean  "allow_custom_frameworks",   default: false
    t.datetime "expires_at"
    t.index ["name"], name: "index_customers_on_name", unique: true, using: :btree
  end

  create_table "department_types", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_department_types_on_name", unique: true, using: :btree
  end

  create_table "document_types", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_document_types_on_name", unique: true, using: :btree
  end

  create_table "documents", force: :cascade do |t|
    t.integer "review_id",                       null: false
    t.integer "document_type_id",                null: false
    t.string  "url"
    t.string  "name"
    t.boolean "is_enabled",       default: true
  end

  create_table "evidences", force: :cascade do |t|
    t.string  "code",       null: false
    t.string  "name",       null: false
    t.integer "measure_id", null: false
    t.index ["code", "name"], name: "index_evidences_on_code_and_name", unique: true, using: :btree
  end

  create_table "findings", force: :cascade do |t|
    t.integer "review_measure_id",                 null: false
    t.integer "status_type_id",                    null: false
    t.string  "description",                       null: false
    t.integer "user_id"
    t.boolean "is_agreed",         default: false
    t.text    "evidence"
    t.text    "concern"
    t.text    "implication"
    t.text    "recommendation"
    t.index ["review_measure_id", "description"], name: "index_findings_on_review_measure_id_and_description", unique: true, using: :btree
  end

  create_table "impact_types", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_impact_types_on_name", unique: true, using: :btree
  end

  create_table "industry_types", force: :cascade do |t|
    t.string  "name",      null: false
    t.integer "parent_id"
    t.index ["name"], name: "index_industry_types_on_name", unique: true, using: :btree
  end

  create_table "interviews", force: :cascade do |t|
    t.integer  "review_id",                         null: false
    t.integer  "occupation_type_id",                null: false
    t.integer  "user_id"
    t.datetime "interview_date"
    t.boolean  "is_enabled",         default: true
    t.string   "participants"
    t.text     "notes"
  end

  create_table "life_cycle_types", force: :cascade do |t|
    t.string "name",        null: false
    t.text   "description"
    t.index ["name"], name: "index_life_cycle_types_on_name", unique: true, using: :btree
  end

  create_table "measure_document_types", force: :cascade do |t|
    t.integer "measure_id",       null: false
    t.integer "document_type_id", null: false
    t.index ["measure_id", "document_type_id"], name: "index_measure_document_types_on_measure_id_and_document_type_id", unique: true, using: :btree
  end

  create_table "measures", force: :cascade do |t|
    t.string  "code",        null: false
    t.string  "name",        null: false
    t.integer "category_id", null: false
    t.string  "description"
  end

  create_table "observation_links", force: :cascade do |t|
    t.integer  "document_id"
    t.integer  "interview_id"
    t.integer  "review_measure_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "observation_id"
    t.index ["observation_id", "document_id"], name: "observation_links_observation_id_document_id_uindex", unique: true, using: :btree
    t.index ["observation_id", "interview_id"], name: "observation_links_observation_id_interview_id_uindex", unique: true, using: :btree
    t.index ["observation_id", "review_measure_id"], name: "observation_links_observation_id_review_measure_id_uindex", unique: true, using: :btree
  end

  create_table "observations", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "comments",                        null: false
    t.string   "disposition", default: "Neutral", null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "review_id"
  end

  create_table "occupation_types", force: :cascade do |t|
    t.string "name", null: false
    t.text   "tags"
    t.index ["name"], name: "index_occupation_types_on_name", unique: true, using: :btree
  end

  create_table "project_certification_types", force: :cascade do |t|
    t.integer "project_id",            null: false
    t.integer "certification_type_id"
  end

  create_table "project_department_types", force: :cascade do |t|
    t.integer "project_id",         null: false
    t.integer "department_type_id"
  end

  create_table "project_impact_types", force: :cascade do |t|
    t.integer "project_id",     null: false
    t.integer "impact_type_id"
  end

  create_table "project_types", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_project_types_on_name", unique: true, using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "customer_id",                       null: false
    t.integer  "project_type_id",                   null: false
    t.string   "name",                              null: false
    t.string   "description"
    t.boolean  "is_enabled",         default: true, null: false
    t.float    "budget"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.text     "objective"
    t.integer  "industry_type_id"
    t.integer  "life_cycle_type_id"
    t.index ["customer_id", "project_type_id", "name"], name: "index_projects_on_customer_id_and_project_type_id_and_name", unique: true, using: :btree
  end

  create_table "review_evidences", force: :cascade do |t|
    t.integer "review_measure_id", null: false
    t.integer "document_id",       null: false
    t.index ["review_measure_id", "document_id"], name: "index_review_evidences_on_review_measure_id_and_document_id", unique: true, using: :btree
  end

  create_table "review_measures", force: :cascade do |t|
    t.integer  "review_id",                 null: false
    t.integer  "measure_id",                null: false
    t.integer  "user_id",                   null: false
    t.boolean  "is_enabled", default: true
    t.integer  "score"
    t.integer  "weight",     default: 1
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["review_id", "measure_id"], name: "index_review_measures_on_review_id_and_measure_id", unique: true, using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "project_id",                           null: false
    t.integer  "score_id",                             null: false
    t.text     "summary"
    t.text     "context"
    t.text     "scope"
    t.text     "enquiry"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "is_enabled",            default: true, null: false
    t.integer  "lead_firewood_user_id"
    t.integer  "lead_customer_user_id"
    t.datetime "start_date"
    t.datetime "stop_date"
    t.string   "reference_cd"
    t.text     "notes"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true, using: :btree
  end

  create_table "score_ranges", force: :cascade do |t|
    t.integer "score_id",                     null: false
    t.string  "name",                         null: false
    t.integer "min",                          null: false
    t.integer "max",                          null: false
    t.string  "color",    default: "#999999"
    t.index ["score_id", "min", "max"], name: "index_score_ranges_on_score_id_and_min_and_max", unique: true, using: :btree
  end

  create_table "scores", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_scores_on_name", unique: true, using: :btree
  end

  create_table "status_types", force: :cascade do |t|
    t.string  "name",        null: false
    t.string  "description"
    t.integer "priority"
    t.index ["name"], name: "index_status_types_on_name", unique: true, using: :btree
  end

  create_table "template_measures", force: :cascade do |t|
    t.integer "template_id", null: false
    t.integer "measure_id",  null: false
    t.index ["template_id", "measure_id"], name: "index_template_measures_on_template_id_and_measure_id", unique: true, using: :btree
  end

  create_table "templates", force: :cascade do |t|
    t.string "name",        null: false
    t.string "description"
    t.index ["name"], name: "index_templates_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "role_id"
    t.boolean  "is_enabled",             default: true, null: false
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.text     "notes"
    t.string   "phone"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,    null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  add_foreign_key "action_items", "findings"
  add_foreign_key "action_items", "users"
  add_foreign_key "category_score_ranges", "categories"
  add_foreign_key "category_score_ranges", "score_ranges"
  add_foreign_key "customer_categories", "categories"
  add_foreign_key "customer_categories", "customers"
  add_foreign_key "customer_templates", "customers"
  add_foreign_key "customer_templates", "templates"
  add_foreign_key "documents", "document_types"
  add_foreign_key "documents", "reviews"
  add_foreign_key "evidences", "measures"
  add_foreign_key "findings", "review_measures", name: "findings_review_measures_id_fk"
  add_foreign_key "findings", "status_types"
  add_foreign_key "findings", "users"
  add_foreign_key "interviews", "occupation_types"
  add_foreign_key "interviews", "reviews"
  add_foreign_key "interviews", "users"
  add_foreign_key "measure_document_types", "document_types"
  add_foreign_key "measure_document_types", "measures"
  add_foreign_key "measures", "categories"
  add_foreign_key "observation_links", "documents"
  add_foreign_key "observation_links", "interviews"
  add_foreign_key "observation_links", "observations"
  add_foreign_key "observation_links", "review_measures"
  add_foreign_key "observations", "reviews"
  add_foreign_key "observations", "users"
  add_foreign_key "project_certification_types", "certification_types"
  add_foreign_key "project_certification_types", "projects"
  add_foreign_key "project_department_types", "department_types"
  add_foreign_key "project_department_types", "projects"
  add_foreign_key "project_impact_types", "impact_types"
  add_foreign_key "project_impact_types", "projects"
  add_foreign_key "projects", "customers"
  add_foreign_key "projects", "industry_types"
  add_foreign_key "projects", "life_cycle_types"
  add_foreign_key "projects", "project_types"
  add_foreign_key "review_evidences", "documents"
  add_foreign_key "review_evidences", "review_measures"
  add_foreign_key "review_measures", "measures"
  add_foreign_key "review_measures", "reviews"
  add_foreign_key "review_measures", "users"
  add_foreign_key "reviews", "projects"
  add_foreign_key "reviews", "scores"
  add_foreign_key "score_ranges", "scores"
  add_foreign_key "template_measures", "measures"
  add_foreign_key "template_measures", "templates"
  add_foreign_key "users", "customers"
  add_foreign_key "users", "roles"
end
