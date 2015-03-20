class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.integer :dataset_id
      t.text :header
      t.float :min
      t.float :max
      t.float :median
      t.float :mean
    end
  end
end