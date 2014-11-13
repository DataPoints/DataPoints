class AddForeignKey < ActiveRecord::Migration
  def change
  	add_foreign_key :headers, :datasets
  	add_foreign_key :columns, :headers
  	add_foreign_key :datasets, :users 
  end
end
