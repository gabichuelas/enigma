require "./test/test_helper"
require "./lib/enigma"
require "./lib/key"

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_create_shifts
    shifts = {
      a: 3,
      b: 27,
      c: 73,
      d: 20
    }
    assert_equal shifts, @enigma.create_shifts("02715", "040895")
    assert_equal 27, @enigma.create_shifts("02715", "040895")[:b]
  end

  def test_can_prepare_message_for_encryption
    enum = @enigma.prepare("hello world")
    assert_equal true, enum.include?(["h","e","l","l"])
    assert_equal true, enum.include?(["o"," ","w","o"])
    assert_equal true, enum.include?(["r","l","d"])
  end

  def test_can_encrypt_one_char_at_a_time
    assert_equal "k", @enigma.new_char("h", 3)
    assert_equal "d", @enigma.new_char("l", 73)
  end

  def test_can_encrypt
    skip
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_can_decrypt
    skip
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_can_encrypt_using_generated_date
    skip
    encrypted = {

    }
    assert_equal encrypted, @enigma.encrypt("hello world", "02715")
  end

  def test_can_decrypt_using_generated_date
    skip
    encrypted = enigma.encrypt("hello world", "02715")
    decrypted = {

    }
    assert_equal decrypted, @enigma.decrypt(encrypted[:encryption], "02715")
  end

  def test_can_encrypt_using_generated_key_date
    skip
    encrypted = {

    }
    assert_equal encrypted, @enigma.encrypt("hello world")
  end
end
