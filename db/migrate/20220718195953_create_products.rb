class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :store, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
