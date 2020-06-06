require "minitest/autorun"
require "minitest/pride"
require "date"
require "./lib/enigma"

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_can_encrypt
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
