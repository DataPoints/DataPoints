class AddAnalyzeToColumns < ActiveRecord::Migration
  def change
    add_column :columns, :analyze, :boolean, default: false
  end
end
