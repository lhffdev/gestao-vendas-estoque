class CreatePessoaJuridicas < ActiveRecord::Migration[6.0]
  def change
    create_table :pessoa_juridicas do |t|
      t.references :pessoa, null: false, foreign_key: true
      t.string :razao_social, null: false, limit: 250
      t.string :nome_fantasia, limit: 250
      t.string :responsavel, null: false, limit: 200
      t.string :cnpj, null: false, limit: 14, index: { unique: true }
      t.string :inscricao_estadual, limit: 12, index: { unique: true }

      t.timestamps
    end
  end
end
