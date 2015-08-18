class CreateDefaultProducts < ActiveRecord::Migration
  def change
    create_table :default_products, {:id => false} do |t|
      t.string :id
      t.string :title
      t.string :link
      t.string :id
      t.string :id
      t.integer :qualification_id
      t.timestamps
    end
    add_index :default_products, :id

  end
end
