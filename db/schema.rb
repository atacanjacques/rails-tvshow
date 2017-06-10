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

ActiveRecord::Schema.define(version: 20170610095748) do

  create_table "channels", force: :cascade do |t|
    t.string   "nom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "episodes", force: :cascade do |t|
    t.integer  "saison"
    t.integer  "episode"
    t.string   "titre"
    t.integer  "TvShow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["TvShow_id"], name: "index_episodes_on_TvShow_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string   "nom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tv_show_genres", force: :cascade do |t|
    t.integer  "tv_show_id"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_tv_show_genres_on_genre_id"
    t.index ["tv_show_id"], name: "index_tv_show_genres_on_tv_show_id"
  end

  create_table "tv_shows", force: :cascade do |t|
    t.string   "nom"
    t.integer  "statut"
    t.integer  "duree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "channel_id"
    t.index ["channel_id"], name: "index_tv_shows_on_channel_id"
  end

end
