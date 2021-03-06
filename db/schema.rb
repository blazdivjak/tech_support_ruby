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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140104172722) do

  create_table "messages", force: true do |t|
    t.string   "content"
    t.datetime "date"
    t.string   "user"
    t.integer  "privilegelvl"
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.string   "problem"
    t.date     "date"
    t.string   "podrocje"
    t.string   "description"
    t.string   "phone"
    t.integer  "level"
    t.integer  "admin"
    t.integer  "user_id"
    t.string   "state"
    t.string   "string"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "username"
    t.integer  "privilegelvl"
    t.string   "phone"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
