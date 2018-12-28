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

ActiveRecord::Schema.define(version: 2018_12_27_203342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "google_oauth_tokens", force: :cascade do |t|
    t.string "token"
    t.string "refresh_token"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_google_oauth_tokens_on_user_id"
  end

  create_table "links", force: :cascade do |t|
    t.bigint "question_id"
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link_note", limit: 255
    t.index ["question_id"], name: "index_links_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "topic_id"
    t.string "title"
    t.text "notes_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_questions_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "goal"
    t.boolean "complete", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 1
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "google_oauth_tokens", "users"
  add_foreign_key "links", "questions"
  add_foreign_key "questions", "topics"
  add_foreign_key "topics", "users"
end
