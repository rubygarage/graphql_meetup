# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_26_072311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "casts", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "character", null: false
    t.bigint "credit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["credit_id"], name: "index_casts_on_credit_id"
  end

  create_table "credits", force: :cascade do |t|
    t.bigint "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_credits_on_movie_id"
  end

  create_table "crews", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "department", null: false
    t.bigint "credit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["credit_id"], name: "index_crews_on_credit_id"
  end

  create_table "favorite_movies", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_account_id", null: false
    t.bigint "movie_id", null: false
    t.index ["movie_id"], name: "index_favorite_movies_on_movie_id"
    t.index ["user_account_id", "movie_id"], name: "index_favorite_movies_on_user_account_id_and_movie_id", unique: true
    t.index ["user_account_id"], name: "index_favorite_movies_on_user_account_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "description"
    t.string "name", null: false
    t.bigint "user_account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "user_account_id"], name: "index_lists_on_name_and_user_account_id", unique: true
    t.index ["user_account_id"], name: "index_lists_on_user_account_id"
  end

  create_table "lists_movies", force: :cascade do |t|
    t.bigint "list_id"
    t.bigint "movie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["list_id", "movie_id"], name: "index_lists_movies_on_list_id_and_movie_id", unique: true
    t.index ["list_id"], name: "index_lists_movies_on_list_id"
    t.index ["movie_id"], name: "index_lists_movies_on_movie_id"
  end

  create_table "movie_images", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "movie_id", null: false
    t.index ["movie_id"], name: "index_movie_images_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title", null: false
    t.string "original_title"
    t.string "overview"
    t.integer "revenue"
    t.integer "budget"
    t.integer "runtime"
    t.string "original_language"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_accounts", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_user_accounts_on_email", unique: true
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_account_id", null: false
    t.index ["user_account_id"], name: "index_user_profiles_on_user_account_id"
  end

  create_table "watchlist_movies", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_account_id", null: false
    t.bigint "movie_id", null: false
    t.index ["movie_id"], name: "index_watchlist_movies_on_movie_id"
    t.index ["user_account_id", "movie_id"], name: "index_watchlist_movies_on_user_account_id_and_movie_id", unique: true
    t.index ["user_account_id"], name: "index_watchlist_movies_on_user_account_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "casts", "credits"
  add_foreign_key "credits", "movies"
  add_foreign_key "crews", "credits"
  add_foreign_key "favorite_movies", "movies"
  add_foreign_key "favorite_movies", "user_accounts"
  add_foreign_key "lists", "user_accounts"
  add_foreign_key "lists_movies", "lists"
  add_foreign_key "lists_movies", "movies"
  add_foreign_key "movie_images", "movies"
  add_foreign_key "user_profiles", "user_accounts"
  add_foreign_key "watchlist_movies", "movies"
  add_foreign_key "watchlist_movies", "user_accounts"
end
