require 'test_helper'

class DatasetTest < ActiveSupport::TestCase
  test "should respond to user" do
    d = datasets(:one)
    assert_respond_to d, :user
  end

  test "should respond to headers" do
    d = datasets(:one)
    assert_respond_to d, :headers
  end

  test "should respond only to headers tha belong to dataset" do
    d = datasets(:one)
    assert d.headers.all? { |h| h.dataset == d }
  end

  test "headers dependent destroy" do
    d = datasets(:one)
    d.destroy
    assert headers.all? { |h| h.dataset != d }
  end

  test "should respond to analysis_result" do
    d = datasets(:one)
    assert_respond_to d, :analysis_results
  end

  test "should respond only to analysis_result tha belong to dataset" do
    d = datasets(:one)
    assert d.analysis_results.all? { |a| a.dataset == d }
  end

  test "analysis_result dependent destroy" do
    d = datasets(:one)
    d.destroy
    assert analysis_results.all? { |a| a.dataset != d }
  end

  test "presence of user_id" do
    d = Dataset.new
    d.user_id = nil
    d.valid?
    assert_match /can't be blank/, d.errors[:user_id].join, "Error presence of user_id not found"
  end

  test "presence of name" do
    d = Dataset.new
    d.name = nil
    d.valid?
    assert_match /can't be blank/, d.errors[:name].join, "Error presence of name not found"
  end

  test "length of name length" do
    d = Dataset.new
    d.name = "gjkfdgjkdfjgkfdjgksdfjgkdjsfkgjdfkgjkhgkdjghfsjghdsjkghfdjsghjghfdjkghjdfksgjkhf"
    d.valid?
    assert_match /too long/, d.errors[:name].join, "Error length of name not found"
  end

  test "length of description length" do
    d = Dataset.new
    d.description = "12345678912345678912345678912345678912345678912345dskhagfjhdjghfjghdfghjdfhsgjfhgjdhsjghjfgjhdsjghfjdhgkjsdhfgjdhgjksdhfgjfdhjghdsjhgjfdhgjdhsjghfdsjghdfjghaljksrhguriehguiebvjfsdjkvnofjhaguireiuebvjdfsbvksdjfkovsdhguieshuigrghe"
    d.valid?
    assert_match /too long/, d.errors[:description].join, "Error length of description not found"
  end

  test "presence of link" do
    d = Dataset.new
    d.link = nil
    d.valid?
    assert_match /can't be blank/, d.errors[:link].join, "Error presence of link not found"
  end

  test "format of link" do
    d = Dataset.new
    d.link = "fjdsakj"
    d.valid?
    assert_match /invalid/, d.errors[:link].join, "Error format of link not found"
    d.link = "http:dsjfkda"
    d.valid?
    assert_match /invalid/, d.errors[:link].join, "Error format of link not found"
  end

  test "should respond to groupings" do
    d = datasets(:one)
    assert_respond_to d, :groupings
  end

  test "should respond only to grouping that belong to dataset" do
    d = datasets(:one)
    assert d.groupings.all? { |g| g.dataset == d }
  end

  test "groupings dependent destroy" do
    d = datasets(:one)
    d.destroy
    assert groupings.all? { |g| g.dataset != d}
  end

  test "should respond to coordinates" do
    d = datasets(:one)
    assert_respond_to d, :coordinates
  end

  test "should respond only to coordinates that belong to dataset" do
    d = datasets(:one)
    assert d.coordinates.all? { |c| c.datasets.any? { |dd| dd == d }}
  end

  test "coordinates dependent destroy" do
    d = datasets(:one)
    d.destroy
    assert coordinates.all? { |c| c.datasets.all? { |dd| dd != d}}
  end

end
