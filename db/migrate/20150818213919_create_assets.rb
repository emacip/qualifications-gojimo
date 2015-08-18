class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets, {:id => false} do |t|
      t.string :id
      t.string :copyright
      t.string :meta
      t.integer :size
      t.string  :path
      t.string :unzipped_base_url
      t.hstore  :info
      t.string :link
      t.integer :default_product_id
      t.timestamps
    end
  end
end
