class AddColumnidToGroupings < ActiveRecord::Migration
  def change
    add_column :groupings, :columnid, :integer
  end
end
