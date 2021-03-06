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

ActiveRecord::Schema.define(version: 20161108204642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "workout_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
    t.index ["workout_id"], name: "index_likes_on_workout_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "code"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "team_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "role",                 default: 0
    t.string   "fitbit_access_token"
    t.string   "fitbit_refresh_token"
    t.date     "last_logged_in"
    t.string   "fitbit_id"
    t.index ["team_id"], name: "index_users_on_team_id", using: :btree
  end

  create_table "workouts", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "time_elapsed"
    t.integer  "calories_burned"
    t.float    "distance"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "fitbit_id"
    t.date     "date"
    t.index ["activity_id"], name: "index_workouts_on_activity_id", using: :btree
    t.index ["user_id"], name: "index_workouts_on_user_id", using: :btree
  end

  add_foreign_key "likes", "users"
  add_foreign_key "likes", "workouts"
  add_foreign_key "users", "teams"
  add_foreign_key "workouts", "activities"
  add_foreign_key "workouts", "users"
end
