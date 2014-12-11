require 'test_helper'

class PgConnectionCounterTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, PgConnectionCounter
  end
end
