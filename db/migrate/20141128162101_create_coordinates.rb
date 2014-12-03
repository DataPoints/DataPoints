class CreateCoordinates < ActiveRecord::Migration
  def change
    create_table :coordinates do |t|
      t.string :mesto
      t.float :lat
      t.float :lng

      t.timestamps
    end

    add_index :coordinates, :mesto, unique: true
  end
end
