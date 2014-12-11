class AddAnalysisProgressToAnalysisResult < ActiveRecord::Migration
  def change
    add_column :analysis_results, :analysisProgress, :int, default: 0
  end
end
