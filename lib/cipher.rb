require_relative 'encryptable'

class Cipher
  include Encryptable

  def encrypt_chars(message, key, date)
    shift_by = create_shifts(key, date)
    prepare(message).reduce([]) do |acc, char|
      4.times do |i|
        acc << shift(char[i], shift_by["#{i}"]) if char[i]
      end
      acc
    end
  end

  def decrypt_chars(message, key, date)
    shift_by = create_shifts(key, date)
    prepare(message).reduce([]) do |acc, char|
      4.times do |i|
        acc << shift(char[i], -shift_by["#{i}"]) if char[i]
      end
      acc
    end
  end

  def shift(char, shift)
    if ALPHA.include?(char)
      new_index = (ALPHA.index(char) + shift) % ALPHA.count
      ALPHA[new_index]
    else
      char
    end
  end

  def crack_key(message, date)
    Key::NUMS.find do |test_key|
      decryption = decrypt_chars(message, test_key, date).join
      decryption[-4..-1] == " end"
    end
  end
end
