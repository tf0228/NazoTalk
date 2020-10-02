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

ActiveRecord::Schema.define(version: 2020_10_02_050359) do

  create_table "comments", force: :cascade do |t|
    t.integer "host_id", null: false
    t.integer "client_id", null: false
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_comments_on_client_id"
    t.index ["host_id"], name: "index_comments_on_host_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_favorites_on_question_id"
    t.index ["user_id", "question_id"], name: "index_favorites_on_user_id_and_question_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "user_id"
    t.text "sentence"
    t.string "image_id"
    t.string "hint_1"
    t.string "hint_2"
    t.string "hint_3"
    t.string "answer", null: false
    t.text "commentary"
    t.string "answer_image_id"
    t.float "average_rating", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number"
    t.index ["number"], name: "index_questions_on_number", unique: true
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "question_id"
    t.integer "value", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_ratings_on_question_id"
    t.index ["user_id", "question_id"], name: "index_ratings_on_user_id_and_question_id", unique: true
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.text "profile"
    t.integer "rank", default: 0, null: false
    t.string "image_id"
    t.boolean "is_active", default: true, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
