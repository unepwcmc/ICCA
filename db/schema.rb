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

ActiveRecord::Schema.define(:version => 20111004142828) do

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

  create_table "documents", :force => true do |t|
    t.integer   "form_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "doc_file_name"
    t.string    "name"
    t.integer   "site_id"
  end

  create_table "forms", :force => true do |t|
    t.integer   "site_id"
    t.integer   "user_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "spatial_data_file_name"
    t.string    "spatial_data_content_type"
    t.integer   "spatial_data_file_size"
    t.timestamp "spatial_data_updated_at"
    t.string    "name"
    t.text      "edit_link"
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
    t.string    "content_for"
    t.text      "body"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "title"
  end

  create_table "tolk_locales", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tolk_locales", ["name"], :name => "index_tolk_locales_on_name", :unique => true

  create_table "tolk_phrases", :force => true do |t|
    t.text     "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tolk_translations", :force => true do |t|
    t.integer  "phrase_id"
    t.integer  "locale_id"
    t.text     "text"
    t.text     "previous_text"
    t.boolean  "primary_updated", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tolk_translations", ["phrase_id", "locale_id"], :name => "index_tolk_translations_on_phrase_id_and_locale_id", :unique => true

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
