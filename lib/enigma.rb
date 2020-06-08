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

  def decrypt(message, key = KEY, date = DATE)
    decrypted = decrypt_chars(message, key, date)
    {
      decryption: decrypted.join,
      key: key,
      date: date
    }
  end

  def crack(ciphertext, date = DATE)
    # key = method to find key?
    cracked = crack_chars(ciphertext)
    {
      decryption: cracked.join,
      date: date
      # key: key
    }
  end

end

# enigma = Enigma.new
# p enigma.crack("vjqtbeaweqihssi")
