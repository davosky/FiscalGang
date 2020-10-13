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

ActiveRecord::Schema.define(version: 2020_10_13_170121) do

  create_table "dashboards", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.text "content"
    t.bigint "user_id"
    t.bigint "message_priority_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_priority_id"], name: "index_dashboards_on_message_priority_id"
    t.index ["user_id"], name: "index_dashboards_on_user_id"
  end

  create_table "icric_pais", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "code"
    t.date "date"
    t.string "name"
    t.string "surname"
    t.string "phone"
    t.string "email"
    t.bigint "use_type_id"
    t.bigint "location_id"
    t.bigint "user_id"
    t.date "completion_date"
    t.boolean "completed"
    t.string "updater"
    t.string "note"
    t.string "fiscal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_icric_pais_on_location_id"
    t.index ["use_type_id"], name: "index_icric_pais_on_use_type_id"
    t.index ["user_id"], name: "index_icric_pais_on_user_id"
  end

  create_table "isee_cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "code"
    t.date "date"
    t.string "name"
    t.string "surname"
    t.string "phone"
    t.string "email"
    t.bigint "use_type_id"
    t.bigint "location_id"
    t.bigint "user_id"
    t.date "completion_date"
    t.boolean "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "updater"
    t.string "note"
    t.string "fiscal_code"
    t.index ["location_id"], name: "index_isee_cards_on_location_id"
    t.index ["use_type_id"], name: "index_isee_cards_on_use_type_id"
    t.index ["user_id"], name: "index_isee_cards_on_user_id"
  end

  create_table "locations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "message_priorities", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "use_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.bigint "location_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "user_type"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["location_id"], name: "index_users_on_location_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dashboards", "message_priorities"
  add_foreign_key "dashboards", "users"
  add_foreign_key "icric_pais", "locations"
  add_foreign_key "icric_pais", "use_types"
  add_foreign_key "icric_pais", "users"
  add_foreign_key "isee_cards", "locations"
  add_foreign_key "isee_cards", "use_types"
  add_foreign_key "isee_cards", "users"
  add_foreign_key "users", "locations"
end
