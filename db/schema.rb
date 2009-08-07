# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090807051259) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_signups", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.date     "date"
    t.float    "fee"
    t.integer  "venue_id"
    t.boolean  "official",   :default => false
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation", :limit => 20
    t.string   "developer"
    t.string   "publisher"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "platforms", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation", :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "access_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournament_game_signups", :force => true do |t|
    t.integer  "user_id"
    t.integer  "tournament_game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournament_games", :force => true do |t|
    t.integer  "tournament_id"
    t.integer  "game_id"
    t.integer  "platform_id"
    t.float    "fee"
    t.time     "start_at"
    t.time     "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournaments", :force => true do |t|
    t.string   "name"
    t.date     "date"
    t.float    "fee"
    t.integer  "venue_id"
    t.boolean  "official",   :default => false
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_games", :force => true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "platform_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_profiles", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "first_name",                :limit => 50
    t.string   "last_name",                 :limit => 50
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.boolean  "active",                                   :default => true
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state",       :limit => 2
    t.string   "postal_code"
    t.string   "phone"
    t.string   "info"
    t.boolean  "private",                  :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
