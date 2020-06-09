require './test/test_helper'
require './lib/cipher'

class CipherTest < Minitest::Test

  def setup
    @cipher = Cipher.new
  end

  def test_create_shifts
    shifts = {
      "0" => 3,
      "1" => 27,
      "2" => 73,
      "3" => 20
    }
    assert_equal shifts, @cipher.create_shifts("02715", "040895")
    assert_equal 27, @cipher.create_shifts("02715", "040895")["1"]
  end

  def test_can_prepare_message_for_encryption
    enum = @cipher.prepare("hello world")

    assert_equal true, enum.include?(["h","e","l","l"])
    assert_equal true, enum.include?(["o"," ","w","o"])
    assert_equal true, enum.include?(["r","l","d"])
  end

  def test_can_shift_character_by_shift_amount
    assert_equal "k", @cipher.shift("h", 3)
    assert_equal "h", @cipher.shift("k", -3)
    assert_equal "d", @cipher.shift("l", 73)
    assert_equal "!", @cipher.shift("!", 2)
  end

  def test_can_crack_key
    assert_equal "08304", @cipher.crack_key("vjqtbeaweqihssi", "291018")
  end

end
