class CreatePessoas < ActiveRecord::Migration[6.0]
  def change
    create_table :pessoas do |t|
      t.string :logradouro, null: false
      t.string :numero, null: false
      t.string :bairro, null: false
      t.integer :cidade_id, null: false, index: true
      t.integer :telefone
      t.integer :celular
      t.string :email

      t.timestamps
    end

    add_foreign_key :pessoas, :cidades, column: :cidade_id, primary_key: :cd_ibge
  end
end
