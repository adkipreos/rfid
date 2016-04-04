require 'test_helper'

class AdminTest < ActiveSupport::TestCase

  def setup
    @admin = Admin.new(name: "Example User",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @admin.valid?
  end

  test "name should be present" do
    @admin.name = "     "
    assert_not @admin.valid?
  end


end

