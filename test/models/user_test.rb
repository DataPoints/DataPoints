require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "valid with all attributed" do
    u = users(:one)
    assert u.valid?, "User was not valid"
  end

  test "no name gives error message" do
    u = users(:one)
    u.name = nil
    u.valid?
    assert_match /can't be blank/, u.errors[:name].join, "Presence error not found on user name"
  end

  test "long name" do
    u = users(:one)
    u.name = "fdsghfjkghfdjkghdfksjhgfjkdshfgkhsdhgjdfgjdshjgkdhsguhajkfghuisdfhgdfioshjdfgsjhgeshigfdshxiuefghs"
    u.valid?
    assert_match /too long/, u.errors[:name].join, "Long error on user name not found"
  end

  test "no email gives error message" do
    u = users(:one)
    u.email = nil
    u.valid?
    assert_match /can't be blank/, u.errors[:email].join, "Presence error not found on user email"
  end

  test "wrong email format" do
    u = users(:one)
    u.email = "fdjsak"
    u.valid?
    assert_match /invalid/, u.errors[:email].join, "Foramt error not found on user email"
  end

  test "email not unique" do
    u = User.new
    u.name = users(:one).name
    u.email = users(:one).email
    u.password = "aaaaaa"
    u.password_confirmation = "aaaaaa"
    u.valid?
    assert_match /has already been taken/, u.errors[:email].join, "Uniqness error not found on user email"
  end

  test "no password" do
    u = User.new
    u.name = users(:one).name
    u.email = users(:one).email
    u.password = ""
    u.password_confirmation = ""
    u.valid?
    assert_match /can't be blank/, u.errors[:password].join, "Presenece error not found for user password"
  end

  test "short password" do
    u = User.new
    u.name = users(:one).name
    u.email = users(:one).email
    u.password = "123"
    u.password_confirmation = "123"
    u.valid?
    assert_match /too short/, u.errors[:password].join, "Short password error not found"
  end

  test "not matching confirmation password" do
    u = User.new
    u.name = users(:one).name
    u.email = users(:one).email
    u.password = "aaaaaa"
    u.password_confirmation = "bbbbbb"
    u.valid?
    assert_match /doesn't match/, u.errors[:password_confirmation].join, "Matching passwords error not found"
  end

  test "secure password" do
    u = User.new
    u.name = users(:one).name
    u.email = users(:one).email
    u.password = "aaaaaa"
    u.password_confirmation = "bbbbbb"
    u.save
    assert_not_equal u.password, u.password_digest, "Secure password error not found"
  end

  test "activation" do
    u = users(:one)
    u.activate
    assert u.activated, "Activation error not found"
  end

  test "create reset digest" do
    u = users(:one)
    u.create_reset_digest
    assert u.reset_digest.present? && u.reset_sent_at.present?, "Reset digest errors not found"
  end

  test "remember" do
    u = users(:one)
    u.remember
    assert u.remember_digest.present?, "Remember error not found"
  end

  test "forget" do
    u = users(:one)
    u.remember
    u.forget
    assert u.remember_digest.nil?, "Forget error not found"
  end

  test "downcase email" do
    u = users(:one)
    u.email = "TEST@EXAMPLE.COM"
    assert_equal "test@example.com", u.instance_eval{ downcase_email }, "Downcase error not found"
  end

  test "create activation digest" do
    u = users(:one)
    u.instance_eval{ create_activation_digest }
    assert u.activation_token.present? && u.activation_digest.present?, "Activation digest error not found"
  end

  test "should respond to datasets" do
    u = users(:one)
    assert_respond_to u, :datasets
  end

  test "should contain only datasets that belong to user" do
    u = users(:one)
    assert u.datasets.all? { |d| d.user == u }
  end

end