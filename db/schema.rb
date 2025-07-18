# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_10_18_140017) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "concepts", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "description"
    t.bigint "controversy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controversy_id"], name: "index_concepts_on_controversy_id"
  end

  create_table "concepts_fragments", id: false, force: :cascade do |t|
    t.bigint "fragment_id", null: false
    t.bigint "concept_id", null: false
  end

  create_table "controversies", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subtitle"
    t.jsonb "data", default: {"blocks" => []}
    t.text "data_rendered"
  end

  create_table "fragments", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "image"
    t.text "full_text"
    t.text "summary_short"
    t.text "summary_long"
    t.text "url"
    t.text "source"
    t.bigint "controversy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "published_at"
    t.datetime "analyzed_on"
    t.text "analyze_answer"
    t.boolean "analyzed"
    t.index ["controversy_id"], name: "index_fragments_on_controversy_id"
  end

  add_foreign_key "concepts", "controversies"
  add_foreign_key "fragments", "controversies"
end
