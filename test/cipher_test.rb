require './test/test_helper'
require './lib/cipher'

class CipherTest < Minitest::Test

  def setup
    @cipher = Cipher.new
  end

  def test_create_shifts
    shifts = {
      "0"=>3,
      "1"=>27,
      "2"=>73,
      "3"=>20
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

  def test_can_encrypt_one_char_at_a_time
    assert_equal "k", @cipher.new_char("h", 3)
    assert_equal "d", @cipher.new_char("l", 73)
    assert_equal "!", @cipher.new_char("!", 2)
  end

  def test_can_decrypt_one_char_at_a_time
    assert_equal "h", @cipher.original_char("k", 3)
    assert_equal "l", @cipher.original_char("d", 73)
    assert_equal "?", @cipher.original_char("?", 73)
  end

end
