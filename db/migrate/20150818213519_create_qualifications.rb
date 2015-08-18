class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications, {:id => false} do |t|
      t.string :id
      t.string :name
      t.string :link
      t.integer :country_id
      t.timestamps
    end
    add_index :qualifications, :id

  end
end
