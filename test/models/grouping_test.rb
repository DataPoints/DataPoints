require 'test_helper'

class GroupingTest < ActiveSupport::TestCase
  test "should respond to coordinate" do
    g = groupings(:one)
    assert_respond_to g, :coordinate
  end

  test "should respond to dataset" do
    g = groupings(:one)
    assert_respond_to g, :dataset
  end

  test "validate uniqueness od dataset and coordinate combination" do
    g = groupings(:one)
    assert_not g.valid?, "Validation of dataset and coordination combination not found"
  end
end
