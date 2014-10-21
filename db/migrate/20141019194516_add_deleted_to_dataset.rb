class AddDeletedToDataset < ActiveRecord::Migration
  def change
    add_column :datasets, :deleted, :bool, default: false
  end
end
