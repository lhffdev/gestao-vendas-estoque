class CreatePessoaFisicas < ActiveRecord::Migration[6.0]
  def change
    create_table :pessoa_fisicas do |t|
      t.references :pessoa, null: false, foreign_key: true
      t.string :nome, null: false, limit: 200
      t.string :cpf, null: false, limit: 11, index: { unique: true }
      t.string :rg, null: false, limit: 9, index: { unique: true }

      t.timestamps
    end
  end
end
