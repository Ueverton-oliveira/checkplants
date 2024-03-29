class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.st_point :lonlat, geographic: true

      t.timestamps
    end

    add_index :stores, :lonlat, using: :gist
  end
end
