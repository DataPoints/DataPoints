class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.string :name
      t.string :description
      t.string :link
      t.references :user, index: true
      
      t.timestamps null:false
    end
    add_index :datasets, [:user_id, :created_at]
  end
end
