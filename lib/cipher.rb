require_relative 'encryptable'

class Cipher
  include Encryptable

  def encrypt_chars(message, key, date)
    shift_by = create_shifts(key, date)
    prepare(message).reduce([]) do |acc, char|
        acc << shift(char[0], shift_by["0"])
        acc << shift(char[1], shift_by["1"]) if char[1]
        acc << shift(char[2], shift_by["2"]) if char[2]
        acc << shift(char[3], shift_by["3"]) if char[3]
        acc
    end
  end

  def decrypt_chars(message, key, date)
    shift_by = create_shifts(key, date)
    prepare(message).reduce([]) do |acc, char|
        acc << shift(char[0], -shift_by["0"])
        acc << shift(char[1], -shift_by["1"]) if char[1]
        acc << shift(char[2], -shift_by["2"]) if char[2]
        acc << shift(char[3], -shift_by["3"]) if char[3]
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

  def crack_key(message)
    shift_labels = %w(0 1 2 3).rotate(message.length % 4)
    shifts = []
    shifts << ALPHA.index(message[-4]) - ALPHA.index(" ")
    shifts << ALPHA.index(message[-3]) - ALPHA.index("e")
    shifts << ALPHA.index(message[-2]) - ALPHA.index("n")
    shifts << ALPHA.index(message[-1]) - ALPHA.index("d")

    shift_labels.zip(shifts).to_h
    # return is a hash w shift values to decrypt, using keys 0-3 as a-d
  end

  def crack_chars(message)
    shift_hash = crack_key(message)
    prepare(message).reduce([]) do |acc, char|
        acc << shift(char[0], -shift_hash["0"])
        acc << shift(char[1], -shift_hash["1"]) if char[1]
        acc << shift(char[2], -shift_hash["2"]) if char[2]
        acc << shift(char[3], -shift_hash["3"]) if char[3]
        acc
    end
  end

end
