class CreateUsuarios < ActiveRecord::Migration[6.0]
  def change
    create_table :usuarios do |t|
      t.string :username, null: false, limit: 50, index: { unique: true }
      t.string :password, null: false, limit: 50
      t.references :pessoa, null: false, foreign_key: true, index: { unique: true }
      t.integer :ativo, null: false, default: 1

      t.timestamps
    end
  end
end
