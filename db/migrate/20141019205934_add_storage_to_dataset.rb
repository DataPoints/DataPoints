class AddStorageToDataset < ActiveRecord::Migration
  def change
    add_column :datasets, :storage, :string
  end
end
