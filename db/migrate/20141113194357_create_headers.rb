class CreateHeaders < ActiveRecord::Migration
  def change
    create_table :headers do |t|
      t.boolean :origin
      t.references :dataset, index: true
      t.belongs_to :column, index: true

      t.timestamps
    end
  end
end
