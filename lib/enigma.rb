require_relative 'cipher'

class Enigma < Cipher
  def encrypt(message, key = KEY, date = DATE)
    encrypted = encrypt_chars(message, key, date)
    {
      encryption: encrypted.join,
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date = DATE)
    decrypted = decrypt_chars(message, key, date)
    {
      decryption: decrypted.join,
      key: key,
      date: date
    }
  end

  def crack(ciphertext, date = DATE)
    key = crack_key(ciphertext, date)
    decrypted = decrypt_chars(ciphertext, key, date)
    {
      decryption: decrypted.join,
      date: date,
      key: key
    }
  end
end
