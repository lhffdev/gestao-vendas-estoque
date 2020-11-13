class CreateCidades < ActiveRecord::Migration[6.0]
  def change
    create_table :cidades, id: false do |t|
      t.integer :cd_ibge, primary_key: true
      t.string :nome, null: false
      t.string :uf, null: false, index: true

      t.timestamps
    end

    add_foreign_key :cidades, :estados, column: :uf, primary_key: :uf
  end
end
