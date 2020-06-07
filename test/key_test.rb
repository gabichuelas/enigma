require './lib/key'

class KeyTest < Minitest::Test

  def setup
    @key = Key.new
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

  def test_returns_5_digit_string
    Key.stubs(:rand).returns("01011")
    assert_equal "01011", Key.make
  end
end
