class CreatePessoaFisicas < ActiveRecord::Migration[6.0]
  def change
    create_table :pessoa_fisicas do |t|
      t.references :pessoa, null: false, foreign_key: true
      t.string :nome, null: false, limit: 255
      t.integer :cpf, null: false
      t.integer :rg, null: false

      t.timestamps
    end
  end
end
