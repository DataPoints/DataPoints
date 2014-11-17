class AddStorageToDataset < ActiveRecord::Migration
  def change
    add_column :datasets, :data_table_name, :string
    add_column :datasets, :analyzed_progress, :decimal, default: 0
    add_column :datasets, :deleted, :bool, default: false
    add_column :datasets, :status, :string
    add_column :datasets, :storage, :string 
  end
end
