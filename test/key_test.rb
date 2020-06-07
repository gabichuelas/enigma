require './test/test_helper'
require './lib/key'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_returns_5_digit_string
    assert_equal 5, Key.make.length

    Key.stubs(:rand).returns("01011")
    assert_equal "01011", Key.make

    Key.stubs(:rand).returns("721")
    assert_equal "00721", Key.make

    Key.stubs(:rand).returns("7")
    assert_equal "00007", Key.make
  end
end
