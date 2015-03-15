class AddColumnIsAdminToUser < ActiveRecord::Migration
  def change
    add_column :users, :isAdmin, :boolean, default:false
  end
end
