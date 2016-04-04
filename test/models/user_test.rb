require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", lastname: "Example", rfid: "Example")
  end

  test "should be valid" do
    assert @user.valid?
  end
  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end
  test "lastname should be present" do
    @user.lastname = "     "
    assert_not @user.valid?
  end
  test "id should be present" do
    @user.rfid = "     "
    assert_not @user.valid?
  end
end
