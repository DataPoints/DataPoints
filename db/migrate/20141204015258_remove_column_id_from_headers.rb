class RemoveColumnIdFromHeaders < ActiveRecord::Migration
  def change
    remove_column :headers, :column_id
  end
end
