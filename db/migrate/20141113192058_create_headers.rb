class CreateHeaders < ActiveRecord::Migration
  def change
    create_table :headers do |t|
      t.boolean :origin
      t.references :user, index: true
      t.references :dataset, index: true
    end
    add_index :headers, [:user_id, :dataset_id]
  end
end
