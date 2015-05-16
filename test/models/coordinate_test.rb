require 'test_helper'

class CoordinateTest < ActiveSupport::TestCase
  test "validate mesto uniqueness" do
    c = Coordinate.new
    c.mesto = "bratislava"
    c.valid?
    assert_match /has already been taken/, c.errors[:mesto].join, "Uniqueness mesto error not found"
    c.mesto = "Bratislava"
    c.valid?
    assert_match /has already been taken/, c.errors[:mesto].join, "Uniqueness mesto error not found"
  end

  test "validate lat presence" do
    c = coordinates(:one)
    c.lat = nil
    c.valid?
    assert_match /can't be blank/, c.errors[:lat].join, "Presence error on lat not found"
  end

  test "validate lng presence" do
    c = coordinates(:one)
    c.lng = nil
    c.valid?
    assert_match /can't be blank/, c.errors[:lng].join, "Presence error on lng not found"
  end

  test "should respond to groupings" do
    c = coordinates(:one)
    assert_respond_to c, :groupings
  end

  test "should respond only to groupings that belong to coordinate" do
    c = coordinates(:one)
    assert c.groupings.all? { |g| g.coordinate == c }
  end

  test "groupings dependent destroy" do
    c = coordinates(:one)
    c.destroy
    assert groupings.all? { |g| g.coordinate != c }
  end

  test "should respond to datasets" do
    c = coordinates(:one)
    assert_respond_to c, :datasets
  end

  test "should respond only to datasets that belong to coordinate" do
    c = coordinates(:one)
    assert c.datasets.all? { |d| d.coordinates.any? { |cc| cc == c }}
  end
end
