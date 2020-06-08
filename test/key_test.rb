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

    Key::NUMS.stubs(:sample).returns("01011")
    assert_equal "01011", Key.make

    Key::NUMS.stubs(:sample).returns("00007")
    assert_equal "00007", Key.make
  end
end
