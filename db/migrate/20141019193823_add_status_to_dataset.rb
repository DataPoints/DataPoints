class AddStatusToDataset < ActiveRecord::Migration
  def change
    add_column :datasets, :status, :string
  end
end
