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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130822192138) do

  create_table "announcements", :force => true do |t|
    t.string   "header"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contents", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.boolean  "published",  :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "districts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  create_table "documents", :force => true do |t|
    t.integer  "intergroup_session_id"
    t.string   "title"
    t.integer  "document_type",         :default => 0
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.text     "body"
  end

  create_table "forum_posts", :force => true do |t|
    t.string   "author",     :default => "Anonymous"
    t.string   "title"
    t.text     "body"
    t.integer  "forum_id"
    t.integer  "views",      :default => 0
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "forum_replies", :force => true do |t|
    t.string   "author",        :default => "Anonymous"
    t.text     "body"
    t.integer  "forum_post_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  create_table "forums", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "allow_new_posts", :default => true
    t.boolean  "visible",         :default => true
    t.text     "instructions"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "intergroup_sessions", :force => true do |t|
    t.datetime "session_date"
    t.integer  "attendance",   :default => 0
    t.boolean  "quorum",       :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "meeting_addresses", :force => true do |t|
    t.integer  "district_id"
    t.string   "building"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "notes"
    t.string   "lat"
    t.string   "lng"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "meetings", :force => true do |t|
    t.string   "title"
    t.integer  "meeting_address_id"
    t.integer  "wday"
    t.integer  "hour"
    t.integer  "minute"
    t.string   "topic"
    t.string   "contact"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "menus", :force => true do |t|
    t.string   "label"
    t.string   "path",       :default => "/"
    t.boolean  "published",  :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "location",   :default => 0
  end

  create_table "messages", :force => true do |t|
    t.string   "contact_name"
    t.string   "contact_details"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "viewed",          :default => false
    t.boolean  "responded_to",    :default => false
    t.boolean  "resolved",        :default => false
    t.string   "kind",            :default => "website"
    t.string   "contact_id"
    t.string   "audio_url"
    t.integer  "audio_duration",  :default => 0
  end

  create_table "motions", :force => true do |t|
    t.integer  "document_id"
    t.string   "title"
    t.text     "body"
    t.integer  "vote_yes",     :default => 0
    t.integer  "vote_no",      :default => 0
    t.integer  "vote_abstain", :default => 0
    t.boolean  "passes",       :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "content"
    t.boolean  "published",  :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "sections", :force => true do |t|
    t.integer  "document_id"
    t.string   "heading"
    t.text     "body"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "site_configs", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.boolean  "on"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "transactions", :force => true do |t|
    t.integer  "document_id"
    t.decimal  "amount",      :precision => 10, :scale => 2, :default => 0.0
    t.integer  "method",                                     :default => 0
    t.boolean  "expense",                                    :default => false
    t.datetime "timestamp"
    t.string   "description"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
  end

end
