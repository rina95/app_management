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

ActiveRecord::Schema[7.0].define(version: 2024_02_16_072539) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apps", force: :cascade do |t|
    t.integer "software_id"
    t.integer "plan_id"
    t.integer "app_type"
    t.boolean "use_sso"
    t.boolean "connect_idm"
    t.boolean "connect_ecm"
    t.boolean "connect_log_tt"
    t.boolean "connect_open_api"
    t.boolean "connect_esb"
    t.boolean "use_ha"
    t.boolean "use_dr"
    t.boolean "use_microservice"
    t.string "external_system"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_apps_on_plan_id"
    t.index ["software_id"], name: "index_apps_on_software_id"
  end

  create_table "book_meetings", force: :cascade do |t|
    t.string "plan_code"
    t.string "software_version"
    t.integer "software_id"
    t.string "title"
    t.string "document_link"
    t.string "file"
    t.boolean "urgent"
    t.date "expect_meeting_date"
    t.integer "app_type"
    t.string "app_type_text"
    t.integer "request_type"
    t.string "contact_user"
    t.integer "status"
    t.string "invite_member"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["software_id"], name: "index_book_meetings_on_software_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "commentable_id"
    t.string "commentable_type"
    t.text "comment"
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
  end

  create_table "internal_connect_apps", force: :cascade do |t|
    t.integer "app_id"
    t.integer "software_id"
    t.integer "connect_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_internal_connect_apps_on_app_id"
    t.index ["software_id"], name: "index_internal_connect_apps_on_software_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name"
    t.string "link_doc"
    t.integer "min_version_x"
    t.integer "min_version_y"
    t.integer "min_version_z"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_libraries_on_name"
  end

  create_table "library_apps", force: :cascade do |t|
    t.integer "library_id"
    t.integer "app_id"
    t.integer "version_x"
    t.integer "version_y"
    t.integer "version_z"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_library_apps_on_app_id"
    t.index ["library_id"], name: "index_library_apps_on_library_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.datetime "start_date"
    t.string "report_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.integer "software_id"
    t.string "code"
    t.string "software_version"
    t.string "title"
    t.string "document_link"
    t.string "file"
    t.boolean "urgent"
    t.datetime "expect_approval_date"
    t.integer "app_type"
    t.string "app_type_text"
    t.integer "request_type"
    t.string "contact_user"
    t.integer "status"
    t.datetime "latest_sent_date"
    t.datetime "latest_review_date"
    t.datetime "sent_hd_date"
    t.datetime "approval_date"
    t.datetime "deadline_hd_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["software_id"], name: "index_plans_on_software_id"
  end

  create_table "softwares", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "short_name"
    t.integer "sw_type"
    t.boolean "use_db_link"
    t.text "use_db_link_reason"
    t.boolean "use_job_schedule"
    t.boolean "use_history_data"
    t.integer "in_memory", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_softwares_on_code"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "confluence_id"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
