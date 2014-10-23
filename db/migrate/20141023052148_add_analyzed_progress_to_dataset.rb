class AddAnalyzedProgressToDataset < ActiveRecord::Migration
  def change
    add_column :datasets, :analyzed_progress, :decimal, default: 0
  end
end
