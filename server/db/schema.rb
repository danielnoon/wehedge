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

ActiveRecord::Schema.define(version: 2021_01_31_034129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "adminpack"
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "total_money"
    t.integer "total_invested"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.integer "contribution"
  end

  create_table "pick_stocks", force: :cascade do |t|
    t.integer "shares"
    t.bigint "pick_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pick_id"], name: "index_pick_stocks_on_pick_id"
  end

  create_table "picks", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.bigint "groups_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["groups_id"], name: "index_picks_on_groups_id"
    t.index ["users_id"], name: "index_picks_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "firstname"
    t.string "lastname"
    t.integer "wallet"
    t.date "join_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer "count"
    t.bigint "user_id", null: false
    t.bigint "pick_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pick_id"], name: "index_votes_on_pick_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "pick_stocks", "picks"
  add_foreign_key "picks", "groups", column: "groups_id"
  add_foreign_key "picks", "users", column: "users_id"
  add_foreign_key "votes", "picks"
  add_foreign_key "votes", "users"
end
