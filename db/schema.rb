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

ActiveRecord::Schema.define(version: 20161016001755) do

  create_table "answers", force: :cascade do |t|
    t.integer  "user_id",            limit: 4,     null: false
    t.text     "user_input",         limit: 65535
    t.integer  "upload_id",          limit: 4
    t.integer  "question_option_id", limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "answers", ["question_option_id"], name: "index_answers_on_question_option_id", using: :btree
  add_index "answers", ["upload_id"], name: "index_answers_on_upload_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "field_of_works", force: :cascade do |t|
    t.string   "title",      limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "field_types", force: :cascade do |t|
    t.string   "title",      limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "forms", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.integer  "lawyer_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "forms", ["lawyer_id"], name: "index_forms_on_lawyer_id", using: :btree

  create_table "lawyers", force: :cascade do |t|
    t.string   "OAB",                    limit: 255
    t.string   "name",                   limit: 255,              null: false
    t.integer  "field_of_work_id",       limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "lawyers", ["email"], name: "index_lawyers_on_email", unique: true, using: :btree
  add_index "lawyers", ["field_of_work_id"], name: "index_lawyers_on_field_of_work_id", using: :btree
  add_index "lawyers", ["reset_password_token"], name: "index_lawyers_on_reset_password_token", unique: true, using: :btree

  create_table "question_options", force: :cascade do |t|
    t.string   "title",       limit: 255, null: false
    t.integer  "question_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "question_options", ["question_id"], name: "index_question_options_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "title",                         limit: 255,                   null: false
    t.integer  "form_id",                       limit: 4
    t.integer  "field_type_id",                 limit: 4
    t.boolean  "is_required",                   limit: 1,     default: false, null: false
    t.text     "description",                   limit: 65535
    t.text     "law_description",               limit: 65535
    t.integer  "jump_logic_question_option_id", limit: 4
    t.boolean  "jump_logic_if",                 limit: 1
    t.integer  "jump_logic_question_id",        limit: 4
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
  end

  add_index "questions", ["field_type_id"], name: "index_questions_on_field_type_id", using: :btree
  add_index "questions", ["form_id"], name: "index_questions_on_form_id", using: :btree
  add_index "questions", ["jump_logic_question_id"], name: "index_questions_on_jump_logic_question_id", using: :btree
  add_index "questions", ["jump_logic_question_option_id"], name: "index_questions_on_jump_logic_question_option_id", using: :btree

  create_table "uploads", force: :cascade do |t|
    t.string   "file",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "phone",      limit: 255
    t.text     "notes",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_foreign_key "answers", "question_options"
  add_foreign_key "answers", "uploads"
  add_foreign_key "answers", "users"
  add_foreign_key "forms", "lawyers"
  add_foreign_key "lawyers", "field_of_works"
  add_foreign_key "question_options", "questions"
  add_foreign_key "questions", "questions", column: "jump_logic_question_id"
end
