class AddFileHashToDataset < ActiveRecord::Migration
  def change
    add_column :datasets, :filehash, :string
  end
end
