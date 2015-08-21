class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets, :id => false do |t|
      t.string :id
      t.string :copyright
      t.string :meta
      t.integer :size
      t.string  :path
      t.string :unzipped_base_url
      t.hstore  :info, :array => true
      t.string :link
      t.belongs_to :default_product, index:true

      t.timestamps
    end

    change_column :assets, :default_product_id,  :string
  end
end
