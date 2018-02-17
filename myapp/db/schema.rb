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

ActiveRecord::Schema.define(version: 20170916191605) do

  create_table "generes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "ques"
    t.string "opa"
    t.string "opb"
    t.string "opc"
    t.string "opd"
    t.string "ans"
    t.bigint "subgenere_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subgenere_id"], name: "index_questions_on_subgenere_id"
  end

  create_table "scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "score"
    t.bigint "user_id"
    t.bigint "subgenere_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subgenere_id"], name: "index_scores_on_subgenere_id"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "subgeneres", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "genere_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genere_id"], name: "index_subgeneres_on_genere_id"
  end

  create_table "userans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "comp"
    t.bigint "user_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_userans_on_question_id"
    t.index ["user_id"], name: "index_userans_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "questions", "subgeneres"
  add_foreign_key "scores", "subgeneres"
  add_foreign_key "scores", "users"
  add_foreign_key "subgeneres", "generes"
  add_foreign_key "userans", "questions"
  add_foreign_key "userans", "users"
end
