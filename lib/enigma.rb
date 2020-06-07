require_relative 'cipher'

class Enigma < Cipher

  def encrypt(message, key = KEY, date = DATE)
    encrypted = shift_chars(message, key, date)
    {
      encryption: encrypted.join,
      key: key,
      date: date
    }
  end

  def decrypt()
  end

end
