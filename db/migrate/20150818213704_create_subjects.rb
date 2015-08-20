class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects, :id => false do |t|
      t.string :id
      t.string :title
      t.string :link
      t.string :colour
      t.belongs_to :qualification, index:true

    end
    add_index :subjects, :id

  end
end
