class AddStorageToDataset < ActiveRecord::Migration
  def change
    add_column :datasets, :data_table, :string
    add_column :datasets, :header_table, :string
  end
end
