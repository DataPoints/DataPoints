class CreateFirstDatasets < ActiveRecord::Migration
  def change
    create_table :first_datasets  do |t|

      t.string :"Obchodne_meno"
      t.string :"PSC"
      t.string :"Ulica"
      t.string :"Mesto_Obec"
      t.string :"ICO"
      t.string :"Vyska_pohladavky"
      t.string :"Typ_platitela"
    end
  end
end