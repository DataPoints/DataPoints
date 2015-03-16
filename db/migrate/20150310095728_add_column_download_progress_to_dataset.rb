class AddColumnDownloadProgressToDataset < ActiveRecord::Migration
  def change
    add_column :datasets, :downloadProgress, :integer
  end
end
