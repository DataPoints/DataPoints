require 'test_helper'

class AnalysisResultTest < ActiveSupport::TestCase
  test "should respond to dataset" do
    a = analysis_results(:one)
    assert_respond_to a, :dataset
  end
end
