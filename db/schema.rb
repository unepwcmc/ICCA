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

ActiveRecord::Schema.define(:version => 20100827124628) do

  create_table "countries", :force => true do |t|
    t.string    "name"
    t.string    "lat"
    t.string    "lon"
    t.text      "description"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.text      "extended_description"
    t.integer   "site_id"
  end

  create_table "forms", :force => true do |t|
    t.integer  "site_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", :force => true do |t|
    t.string    "name"
    t.string    "link"
    t.integer   "linkable_id"
    t.string    "linkable_type"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.string    "title"
    t.string    "description"
    t.integer   "photoable_id"
    t.string    "photoable_type"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "image_file_name"
    t.string    "image_content_type"
    t.integer   "image_file_size"
    t.timestamp "image_updated_at"
    t.string    "citation"
    t.boolean   "preferred"
  end

  create_table "roles", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "sites", :force => true do |t|
    t.string    "name"
    t.string    "lat"
    t.string    "lon"
    t.text      "extended_description"
    t.integer   "country_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "static_contents", :force => true do |t|
    t.string   "content_for"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "users", :force => true do |t|
    t.string    "username"
    t.string    "email"
    t.string    "crypted_password"
    t.string    "password_salt"
    t.string    "persistence_token"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "role_id"
    t.string    "survey_id"
  end

end
