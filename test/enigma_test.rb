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

  def test_can_encrypt_using_only_key
    encrypted = @enigma.encrypt("hello world", "02715")

    expected = {
      encryption: encrypted[:encryption],
      key: "02715",
      date: Date.today.strftime("%d%m%y")
    }

    assert_equal expected, encrypted
  end

  def test_can_decrypt
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_can_decrypt_using_only_key
    encrypted = @enigma.encrypt("hello world", "02715")

    decrypted = {
      decryption: "hello world",
      key: "02715",
      date: Date.today.strftime("%d%m%y")
    }

    assert_equal decrypted, @enigma.decrypt(encrypted[:encryption], "02715")
  end

  def test_can_encrypt_only_given_message
    encrypted = @enigma.encrypt("hello world")

    decrypted = {
      decryption: "hello world",
      key: encrypted[:key],
      date: encrypted[:date]
    }

    assert_equal decrypted, @enigma.decrypt(encrypted[:encryption], encrypted[:key], encrypted[:date])

    refute encrypted[:key].nil?
    assert_equal 5, encrypted[:key].length
    refute encrypted[:date].nil?
    refute encrypted[:encryption] == "hello world"
  end
end
