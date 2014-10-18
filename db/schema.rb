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

ActiveRecord::Schema.define(version: 20141018185248) do

  create_table "poll_centres", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "poll_centres", ["title"], name: "index_poll_centres_on_title"
  add_index "poll_centres", ["user_id"], name: "index_poll_centres_on_user_id"

  create_table "questions", force: true do |t|
    t.string   "text"
    t.string   "option_a"
    t.string   "option_b"
    t.string   "option_c"
    t.string   "option_d"
    t.boolean  "started",        default: false
    t.boolean  "finished",       default: false
    t.integer  "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "poll_centre_id"
  end

  add_index "questions", ["poll_centre_id"], name: "index_questions_on_poll_centre_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vote_as", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vote_as", ["question_id"], name: "index_vote_as_on_question_id"
  add_index "vote_as", ["user_id"], name: "index_vote_as_on_user_id"

  create_table "vote_bs", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vote_bs", ["question_id"], name: "index_vote_bs_on_question_id"
  add_index "vote_bs", ["user_id"], name: "index_vote_bs_on_user_id"

  create_table "vote_cs", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vote_cs", ["question_id"], name: "index_vote_cs_on_question_id"
  add_index "vote_cs", ["user_id"], name: "index_vote_cs_on_user_id"

  create_table "vote_ds", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vote_ds", ["question_id"], name: "index_vote_ds_on_question_id"
  add_index "vote_ds", ["user_id"], name: "index_vote_ds_on_user_id"

end
