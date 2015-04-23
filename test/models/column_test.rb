require 'test_helper'

class ColumnTest < ActiveSupport::TestCase
  test "should respond to header" do
    c = columns(:one)
    assert_respond_to c, :header
  end

  test "should respond to type" do
    c = columns(:one)
    assert_respond_to c, :type
  end

  test "validate presence of header_id" do
    c = Column.new
    c.header_id = nil
    c.valid?
    assert_match /can't be blank/, c.errors[:header_id].join, "Presence of header_id not found"
  end
end
