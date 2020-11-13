class CreateEstados < ActiveRecord::Migration[6.0]
  def change
    create_table :estados, id: false do |t|
      t.string :uf, primary_key: true
      t.string :nome, null: false

      t.timestamps
    end
  end
end
