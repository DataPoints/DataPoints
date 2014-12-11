class CreateAnalysisResults < ActiveRecord::Migration
  def change
    create_table :analysis_results do |t|
      t.belongs_to :dataset, index: true
      t.json :result
      t.timestamps
    end
  end
end
