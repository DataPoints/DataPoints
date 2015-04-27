require 'test_helper'

class TypeTest < ActiveSupport::TestCase
  test "presence of name" do
    t = Type.new
    t.name = "Numeric"
    t.valid?
    assert_match /has already been taken/, t.errors[:name].join, "Uniqness of type name error not found"
  end

  test "should respond to header" do
    t = types(:one)
    assert_respond_to t, :columns
  end

  test "should contain only columns that belong to type" do
    t = types(:one)
    assert t.columns.all? { |c| c.type == t }
  end

end
