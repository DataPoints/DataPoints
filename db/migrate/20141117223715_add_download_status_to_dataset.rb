class AddDownloadStatusToDataset < ActiveRecord::Migration
  def change
    add_column :datasets, :downloadstatus, :char
  end
end
