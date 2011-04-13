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

ActiveRecord::Schema.define(:version => 20110405174111) do

  create_table "addresses", :force => true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state",         :limit => 2
    t.string   "zipcode",       :limit => 5
    t.integer  "registrant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", :force => true do |t|
    t.string   "email",                             :default => "", :null => false
    t.string   "encrypted_password", :limit => 128, :default => "", :null => false
    t.integer  "sign_in_count",                     :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                   :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true

  create_table "guests", :force => true do |t|
    t.string   "first_name",    :null => false
    t.string   "last_name",     :null => false
    t.string   "age_range",     :null => false
    t.string   "shirt_size"
    t.integer  "registrant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrants", :force => true do |t|
    t.string   "first_name",       :null => false
    t.string   "last_name",        :null => false
    t.string   "email",            :null => false
    t.string   "phone_number",     :null => false
    t.string   "kinship"
    t.string   "confirmation_num"
    t.decimal  "grand_total"
    t.string   "payment_trustee",  :null => false
    t.string   "shirt_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
