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

ActiveRecord::Schema.define(version: 20180711141926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_collections_on_slug", unique: true
  end

  create_table "collections_recipes", id: false, force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "collection_id", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "grocery_items", force: :cascade do |t|
    t.string "name"
    t.string "aisle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.decimal "qty"
    t.string "measurement"
    t.string "note"
    t.string "aisle"
    t.integer "recipe_id"
    t.integer "grocery_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "recipe_id"
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meal_plans", force: :cascade do |t|
    t.integer "recipe_id"
    t.string "user_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_sources", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.string "scrape_name"
    t.string "scrape_ingredient"
    t.string "scrape_image"
    t.string "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "recipe_index_link"
    t.string "category_css"
    t.string "recipe_css"
    t.boolean "multiple_pages"
    t.string "slug"
    t.string "scrape_qty"
    t.string "scrape_measurement"
    t.index ["domain"], name: "index_recipe_sources_on_domain", unique: true
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.jsonb "ingredients_array"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.integer "recipe_source_id"
    t.string "slug"
    t.index ["slug"], name: "index_recipes_on_slug", unique: true
  end

  create_table "recipes_collections", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "collection_id"
  end

end
