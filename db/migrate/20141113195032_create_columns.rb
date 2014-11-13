class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|
      t.references :header, index: true
      t.string :label
      t.references :type, index: true
      t.string :datatyp

      t.timestamps
    end
  end
end
