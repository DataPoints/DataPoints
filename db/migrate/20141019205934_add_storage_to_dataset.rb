class AddStorageToDataset < ActiveRecord::Migration
  def change
    add_column :datasets, :data_table_name, :string
  end
end
