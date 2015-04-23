require 'test_helper'

class HeaderTest < ActiveSupport::TestCase
  test "no dataset_id" do
    h = Header.new
    h.dataset_id = nil
    h.valid?
    assert_match /can't be blank/, h.errors[:dataset_id].join, "Presence error on dataset_id not found"
  end

  test "should respond to columns" do
    h = headers(:one)
    assert_respond_to h, :columns
  end

  test "should contain only columns that belong to header" do
    h = headers(:one)
    assert h.columns.all? { |c| c.header == h }
  end

  test "should respond to dataset" do
    h = headers(:one)
    assert_respond_to h, :dataset
  end

  test "should dependent destroy" do
    h = headers(:one)
    h.destroy
    assert columns.all? { |c| c.header != headers(:one) }
  end
end
