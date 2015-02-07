require 'test_helper'

class LeaseTest < ActiveSupport::TestCase
  test "the truth" do
    assert_equal "Burlington", leases(:lease1).property.state
  end
end
