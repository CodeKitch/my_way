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

ActiveRecord::Schema.define(version: 2020_12_08_122700) do

  create_table "my_artists", force: :cascade do |t|
    t.string "name"
  end

  create_table "my_songs", force: :cascade do |t|
    t.boolean "do_original_name"
    t.string "rename"
    t.boolean "do_original_style"
    t.string "style_of_genre"
    t.boolean "do_electronic_production"
    t.string "electronic_production_description"
    t.boolean "do_sample_original"
    t.string "sample_description"
    t.boolean "do_with_band"
    t.string "with_band_description"
    t.boolean "do_as_instrumental"
    t.string "instrumental_description"
    t.boolean "do_use_intrumental"
    t.string "use_intrumental_description"
    t.boolean "do_rewrite_lyrics"
    t.string "rewrite_lyrics_description"
    t.boolean "do_add_notes"
    t.string "add_notes_description"
    t.integer "artist_id"
    t.integer "song_id"
    t.integer "user_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "song"
    t.string "musician"
    t.string "band"
    t.string "genre"
    t.datetime "year"
    t.datetime "play_time"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
  end

end
