require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_can_encrypt
    expected = {
      encryption: "keder ohulw!",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.encrypt("hello world!", "02715", "040895")
  end

  def test_can_encrypt_using_generated_date
    @enigma.stubs(:today).returns("060620")
    encrypted = @enigma.encrypt("hello world", "02715")
    assert_equal "02715", encrypted[:key]
    assert_equal "060620", encrypted[:date]
  end

  def test_can_decrypt
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_can_decrypt_using_generated_date
    encrypted = @enigma.encrypt("hello world", "02715")
    decrypted = {
      decryption: "hello world",
      key: "02715",
      date: Date.today.strftime("%d%m%y")
    }
    assert_equal decrypted, @enigma.decrypt(encrypted[:encryption], encrypted[:key], encrypted[:date])
  end

  def test_can_encrypt_using_generated_key_date
    encrypted = @enigma.encrypt("hello world")
    decrypted = {
      decryption: "hello world",
      key: encrypted[:key],
      date: encrypted[:date]
    }

    assert_equal decrypted, @enigma.decrypt(encrypted[:encryption], encrypted[:key], encrypted[:date])

    refute encrypted[:key].nil?
    refute encrypted[:date].nil?
    refute encrypted[:encryption] == "hello world"
  end
end
