class CreatePessoas < ActiveRecord::Migration[6.0]
  def change
    create_table :pessoas do |t|
      t.string :cep, null: false, limit: 8
      t.string :logradouro, null: false, limit: 150
      t.string :numero, null: false, limit: 10
      t.string :bairro, null: false, limit: 100
      t.integer :cidade_id, null: false, index: true
      t.string :telefone, limit: 10
      t.string :celular, limit: 11
      t.string :email, limit: 100

      t.timestamps
    end

    add_foreign_key :pessoas, :cidades, column: :cidade_id, primary_key: :cd_ibge
  end
end
