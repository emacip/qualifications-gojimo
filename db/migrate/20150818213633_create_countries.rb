class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :code
      t.string :name
      t.string :link

      t.timestamps
    end
    add_index :countries, :code
  end
end
