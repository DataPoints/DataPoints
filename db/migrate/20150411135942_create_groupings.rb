class CreateGroupings < ActiveRecord::Migration
  def change
    create_table :groupings do |t|
      t.integer :coordinate_id
      t.integer :dataset_id
    end
  end
end
