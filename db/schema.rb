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

ActiveRecord::Schema.define(version: 20160724045532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.integer "guest_id"
    t.integer "playdate_id"
    t.boolean "response"
  end

  create_table "chats", force: :cascade do |t|
    t.string   "identifier"
    t.boolean  "named",      default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "children", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "parent_id",  null: false
    t.string   "allergies"
    t.date     "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.string   "friendable_type"
    t.integer  "friendable_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "blocker_id"
    t.integer  "status"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "chat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playdates", force: :cascade do |t|
    t.string   "title",       null: false
    t.string   "description", null: false
    t.string   "location",    null: false
    t.integer  "host_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "date"
    t.time     "time"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "zipcode"
    t.string   "username",                    null: false
    t.string   "email",                       null: false
    t.string   "password_digest",             null: false
    t.boolean  "vaccinate"
    t.string   "religion"
    t.string   "parenting_style"
    t.string   "date_night"
    t.string   "shopping_prefs"
    t.string   "fav_activities"
    t.string   "music"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar"
    t.integer  "radius",          default: 5
  end

end
