class CreatePessoaJuridicas < ActiveRecord::Migration[6.0]
  def change
    create_table :pessoa_juridicas do |t|
      t.references :pessoa, null: false, foreign_key: true
      t.string :razao_social, null: false, limit: 255
      t.string :nome_fantasia, null: false, limit: 255
      t.string :responsavel, null: false, limit: 255
      t.integer :cnpj, null: false
      t.integer :inscricao_estadual, null: false

      t.timestamps
    end
  end
end
