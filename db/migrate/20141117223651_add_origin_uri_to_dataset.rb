class AddOriginUriToDataset < ActiveRecord::Migration
  def change
    add_column :datasets, :originuri, :string
  end
end
