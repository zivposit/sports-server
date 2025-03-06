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

ActiveRecord::Schema[8.0].define(version: 2025_03_06_100007) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "guides", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "studios", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_studios_on_name", unique: true
  end

  create_table "trainees", force: :cascade do |t|
    t.string "id_number", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "birth_date", null: false
    t.date "join_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id_number"], name: "index_trainees_on_id_number", unique: true
  end

  create_table "trainer_trainees", force: :cascade do |t|
    t.bigint "trainer_id", null: false
    t.bigint "trainee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trainee_id"], name: "index_trainer_trainees_on_trainee_id"
    t.index ["trainer_id", "trainee_id"], name: "index_trainer_trainees_on_trainer_id_and_trainee_id", unique: true
    t.index ["trainer_id"], name: "index_trainer_trainees_on_trainer_id"
  end

  create_table "trainers", force: :cascade do |t|
    t.string "id_number", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "birth_date", null: false
    t.date "join_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id_number"], name: "index_trainers_on_id_number", unique: true
  end

  create_table "training_trainees", force: :cascade do |t|
    t.bigint "training_id", null: false
    t.bigint "trainee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trainee_id"], name: "index_training_trainees_on_trainee_id"
    t.index ["training_id", "trainee_id"], name: "index_training_trainees_on_training_id_and_trainee_id", unique: true
    t.index ["training_id"], name: "index_training_trainees_on_training_id"
  end

  create_table "training_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainings", force: :cascade do |t|
    t.bigint "trainer_id", null: false
    t.bigint "training_type_id", null: false
    t.bigint "studio_id"
    t.datetime "date_time", null: false
    t.integer "duration", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studio_id"], name: "index_trainings_on_studio_id"
    t.index ["trainer_id"], name: "index_trainings_on_trainer_id"
    t.index ["training_type_id"], name: "index_trainings_on_training_type_id"
  end

  add_foreign_key "trainer_trainees", "trainees"
  add_foreign_key "trainer_trainees", "trainers"
  add_foreign_key "training_trainees", "trainees"
  add_foreign_key "training_trainees", "trainings"
  add_foreign_key "trainings", "studios"
  add_foreign_key "trainings", "trainers"
  add_foreign_key "trainings", "training_types"
end
