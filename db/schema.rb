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

ActiveRecord::Schema[8.1].define(version: 2025_12_12_170035) do
  create_table "action_text_rich_texts", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "blockcontents", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "blockmediasets", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", precision: nil, null: false
    t.string "direction"
    t.integer "image_columns", default: 5
    t.string "image_style", default: "bordered"
    t.string "link"
    t.string "title"
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.datetime "created_at"
    t.string "scope"
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "media", force: :cascade do |t|
    t.text "alt"
    t.datetime "created_at", precision: nil
    t.string "name"
    t.string "title"
    t.datetime "updated_at", precision: nil
  end

  create_table "menuitems", force: :cascade do |t|
    t.string "ancestry"
    t.integer "ancestry_depth", default: 0
    t.integer "children_count", default: 0
    t.datetime "created_at", precision: nil, null: false
    t.string "link"
    t.integer "menu_id", null: false
    t.integer "menuitemable_id"
    t.string "menuitemable_type"
    t.string "name"
    t.integer "position"
    t.string "strap"
    t.string "style"
    t.datetime "updated_at", precision: nil, null: false
    t.index ["ancestry"], name: "index_menuitems_on_ancestry"
    t.index ["menu_id"], name: "index_menuitems_on_menu_id"
    t.index ["menuitemable_type", "menuitemable_id"], name: "index_menuitems_on_menuitemable_type_and_menuitemable_id"
  end

  create_table "menus", force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.text "description"
    t.string "name"
    t.datetime "updated_at", precision: nil
  end

  create_table "pages", force: :cascade do |t|
    t.text "banner_text"
    t.text "content"
    t.datetime "created_at", precision: nil
    t.text "description"
    t.boolean "published"
    t.boolean "show_title"
    t.string "slug"
    t.string "template"
    t.string "title"
    t.datetime "updated_at", precision: nil
  end

  create_table "sections", force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.string "name"
    t.integer "position"
    t.integer "sectionable_id"
    t.string "sectionable_type"
    t.integer "sectiontypeable_id"
    t.string "sectiontypeable_type"
    t.boolean "show_title", default: false, null: false
    t.text "style"
    t.string "template"
    t.string "title"
    t.datetime "updated_at", precision: nil
    t.index ["sectionable_type", "sectionable_id"], name: "index_sections_on_sectionable_type_and_sectionable_id"
    t.index ["sectiontypeable_type", "sectiontypeable_id"], name: "index_sections_on_sectiontypeable_type_and_sectiontypeable_id"
  end

  create_table "snippets", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", precision: nil
    t.string "name"
    t.string "slug"
    t.datetime "updated_at", precision: nil
    t.integer "user_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "debug"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.boolean "site_admin"
    t.string "time_zone"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "snippets", "users"
end
