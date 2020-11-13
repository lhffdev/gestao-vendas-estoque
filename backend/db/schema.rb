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

ActiveRecord::Schema.define(version: 2020_05_24_181359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cidades", primary_key: "cd_ibge", id: :serial, force: :cascade do |t|
    t.string "nome", null: false
    t.string "uf", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uf"], name: "index_cidades_on_uf"
  end

  create_table "estados", primary_key: "uf", id: :string, force: :cascade do |t|
    t.string "nome", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pessoa_fisicas", force: :cascade do |t|
    t.bigint "pessoa_id", null: false
    t.string "nome", limit: 255, null: false
    t.integer "cpf", null: false
    t.integer "rg", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pessoa_id"], name: "index_pessoa_fisicas_on_pessoa_id"
  end

  create_table "pessoa_juridicas", force: :cascade do |t|
    t.bigint "pessoa_id", null: false
    t.string "razao_social", limit: 255, null: false
    t.string "nome_fantasia", limit: 255, null: false
    t.string "responsavel", limit: 255, null: false
    t.integer "cnpj", null: false
    t.integer "inscricao_estadual", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pessoa_id"], name: "index_pessoa_juridicas_on_pessoa_id"
  end

  create_table "pessoas", force: :cascade do |t|
    t.string "logradouro", null: false
    t.string "numero", null: false
    t.string "bairro", null: false
    t.integer "cidade_id", null: false
    t.integer "telefone"
    t.integer "celular"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cidade_id"], name: "index_pessoas_on_cidade_id"
  end

  add_foreign_key "cidades", "estados", column: "uf", primary_key: "uf"
  add_foreign_key "pessoa_fisicas", "pessoas"
  add_foreign_key "pessoa_juridicas", "pessoas"
  add_foreign_key "pessoas", "cidades", primary_key: "cd_ibge"
end
