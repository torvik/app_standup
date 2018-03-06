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

ActiveRecord::Schema.define(version: 20180306160938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "addr1"
    t.string   "addr2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.jsonb    "settings",   default: "{}", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "hash_id"
    t.index ["hash_id"], name: "index_accounts_on_hash_id", using: :btree
    t.index ["settings"], name: "index_accounts_on_settings", using: :gin
  end

  create_table "days_of_the_week_memberships", force: :cascade do |t|
    t.integer "team_id"
    t.integer "day"
    t.index ["team_id"], name: "index_days_of_the_week_memberships_on_team_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id", using: :btree
  end

  create_table "standups", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "standup_date"
    t.string   "hash_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_standups_on_user_id", using: :btree
  end

  create_table "task_memberships", force: :cascade do |t|
    t.integer "task_id"
    t.integer "standup_id"
    t.index ["standup_id"], name: "index_task_memberships_on_standup_id", using: :btree
    t.index ["task_id"], name: "index_task_memberships_on_task_id", using: :btree
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "type"
    t.string   "title"
    t.boolean  "is_completed"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "team_memberships", force: :cascade do |t|
    t.integer "team_id"
    t.integer "user_id"
    t.index ["team_id"], name: "index_team_memberships_on_team_id", using: :btree
    t.index ["user_id"], name: "index_team_memberships_on_user_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "account_id"
    t.string   "timezone"
    t.boolean  "has_reminder"
    t.boolean  "has_recap"
    t.string   "hash_id"
    t.time     "reminder_time"
    t.time     "recap_time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "description"
    t.index ["account_id"], name: "index_teams_on_account_id", using: :btree
    t.index ["has_recap", "recap_time"], name: "index_teams_on_has_recap_and_recap_time", using: :btree
    t.index ["has_reminder", "reminder_time"], name: "index_teams_on_has_reminder_and_reminder_time", using: :btree
    t.index ["hash_id"], name: "index_teams_on_hash_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "hash_id"
    t.string   "time_zone"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "account_id"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.string   "invited_by_type"
    t.integer  "invited_by_id"
    t.integer  "invitations_count",      default: 0
    t.index ["account_id"], name: "index_users_on_account_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["hash_id"], name: "index_users_on_hash_id", using: :btree
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
    t.index ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id", using: :btree
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
    t.index ["user_id"], name: "index_users_roles_on_user_id", using: :btree
  end

  add_foreign_key "days_of_the_week_memberships", "teams"
  add_foreign_key "standups", "users"
  add_foreign_key "task_memberships", "standups"
  add_foreign_key "task_memberships", "tasks"
  add_foreign_key "team_memberships", "teams"
  add_foreign_key "team_memberships", "users"
  add_foreign_key "teams", "accounts"
  add_foreign_key "users", "accounts"
end
