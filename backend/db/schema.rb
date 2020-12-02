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

ActiveRecord::Schema.define(version: 2020_12_01_231243) do

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
    t.string "nome", limit: 200, null: false
    t.string "cpf", limit: 11, null: false
    t.string "rg", limit: 9, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cpf"], name: "index_pessoa_fisicas_on_cpf", unique: true
    t.index ["pessoa_id"], name: "index_pessoa_fisicas_on_pessoa_id"
    t.index ["rg"], name: "index_pessoa_fisicas_on_rg", unique: true
  end

  create_table "pessoa_juridicas", force: :cascade do |t|
    t.bigint "pessoa_id", null: false
    t.string "razao_social", limit: 250, null: false
    t.string "nome_fantasia", limit: 250
    t.string "responsavel", limit: 200, null: false
    t.string "cnpj", limit: 14, null: false
    t.string "inscricao_estadual", limit: 12
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cnpj"], name: "index_pessoa_juridicas_on_cnpj", unique: true
    t.index ["inscricao_estadual"], name: "index_pessoa_juridicas_on_inscricao_estadual", unique: true
    t.index ["pessoa_id"], name: "index_pessoa_juridicas_on_pessoa_id"
  end

  create_table "pessoas", force: :cascade do |t|
    t.string "cep", limit: 8, null: false
    t.string "logradouro", limit: 150, null: false
    t.string "numero", limit: 10, null: false
    t.string "bairro", limit: 100, null: false
    t.integer "cidade_id", null: false
    t.string "telefone", limit: 10
    t.string "celular", limit: 11
    t.string "email", limit: 100
    t.integer "ativo", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cidade_id"], name: "index_pessoas_on_cidade_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "username", limit: 50, null: false
    t.string "password", limit: 50, null: false
    t.bigint "pessoa_id", null: false
    t.integer "ativo", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pessoa_id"], name: "index_usuarios_on_pessoa_id", unique: true
    t.index ["username"], name: "index_usuarios_on_username", unique: true
  end

  add_foreign_key "cidades", "estados", column: "uf", primary_key: "uf"
  add_foreign_key "pessoa_fisicas", "pessoas"
  add_foreign_key "pessoa_juridicas", "pessoas"
  add_foreign_key "pessoas", "cidades", primary_key: "cd_ibge"
  add_foreign_key "usuarios", "pessoas"
end
