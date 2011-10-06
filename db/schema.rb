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

ActiveRecord::Schema.define(:version => 20111006182033) do

  create_table "casualcomments", :force => true do |t|
    t.integer  "casualshare_id"
    t.integer  "user_id"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "casualshares", :force => true do |t|
    t.integer  "user_id"
    t.integer  "source_id"
    t.integer  "destination_id"
    t.datetime "starttime"
    t.datetime "endtime"
    t.string   "vehicle"
    t.integer  "amount"
    t.integer  "numofpassengers"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "casualshares", ["destination_id"], :name => "index_casualshares_on_destination_id"
  add_index "casualshares", ["source_id"], :name => "index_casualshares_on_source_id"
  add_index "casualshares", ["user_id"], :name => "index_casualshares_on_user_id"

  create_table "casualsubscriptions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "casualshare_id"
    t.integer  "amount"
    t.integer  "passengers"
    t.boolean  "status"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "casualsubscriptions", ["casualshare_id"], :name => "index_casualsubscriptions_on_casualshare_id"
  add_index "casualsubscriptions", ["user_id"], :name => "index_casualsubscriptions_on_user_id"

  create_table "cities", :force => true do |t|
    t.string   "cityname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", :force => true do |t|
    t.string   "placename"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "places", ["city_id"], :name => "index_places_on_city_id"

  create_table "regularcomments", :force => true do |t|
    t.integer  "regularshare_id"
    t.integer  "user_id"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regularshares", :force => true do |t|
    t.integer  "user_id"
    t.integer  "source_id"
    t.integer  "destination_id"
    t.datetime "starttime"
    t.datetime "endtime"
    t.boolean  "monday"
    t.boolean  "tuesday"
    t.boolean  "wednesday"
    t.boolean  "thursday"
    t.boolean  "friday"
    t.boolean  "saturday"
    t.boolean  "sunday"
    t.string   "vehicle"
    t.integer  "amount"
    t.integer  "numofpassengers"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "regularshares", ["destination_id"], :name => "index_regularshares_on_destination_id"
  add_index "regularshares", ["source_id"], :name => "index_regularshares_on_source_id"
  add_index "regularshares", ["user_id"], :name => "index_regularshares_on_user_id"

  create_table "regularsubscriptions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "regularshare_id"
    t.integer  "amount"
    t.integer  "passengers"
    t.boolean  "status"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "regularsubscriptions", ["regularshare_id"], :name => "index_regularsubscriptions_on_regularshare_id"
  add_index "regularsubscriptions", ["user_id"], :name => "index_regularsubscriptions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname",                            :null => false
    t.string   "lastname",                             :null => false
    t.string   "sex",                                  :null => false
    t.string   "city_id",           :default => "1",   :null => false
    t.integer  "status",            :default => 0,     :null => false
    t.date     "dateofbirth"
    t.string   "phonenumber"
    t.string   "lastloginip"
    t.string   "confirmation"
    t.boolean  "active",            :default => false
  end

  add_index "users", ["city_id"], :name => "index_users_on_city_id"

end
