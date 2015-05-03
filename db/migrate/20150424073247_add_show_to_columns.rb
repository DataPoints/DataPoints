class AddShowToColumns < ActiveRecord::Migration
  def change
    add_column :columns, :show, :boolean, default: true
  end
end
