require_relative 'encryptable'

class Cipher
  include Encryptable

  def shift_chars(message, key, date)
    shift = create_shifts(key, date)
    prepare(message).reduce([]) do |acc, char|
        acc << new_char(char[0], shift[:a])
        acc << new_char(char[1], shift[:b]) if char[1]
        acc << new_char(char[2], shift[:c]) if char[2]
        acc << new_char(char[3], shift[:d]) if char[3]
        acc
    end
  end

  def unshift_chars(message, key, date)
    shift = create_shifts(key, date)
    prepare(message).reduce([]) do |acc, char|
        acc << original_char(char[0], shift[:a])
        acc << original_char(char[1], shift[:b]) if char[1]
        acc << original_char(char[2], shift[:c]) if char[2]
        acc << original_char(char[3], shift[:d]) if char[3]
        acc
    end
  end

  def create_shifts(key, date)
    last_four = (date.to_i ** 2).to_s[-4..-1]
    a = key[0..1].to_i + last_four[0].to_i
    b = key[1..2].to_i + last_four[1].to_i
    c = key[2..3].to_i + last_four[2].to_i
    d = key[3..4].to_i + last_four[3].to_i
    { a: a, b: b, c: c, d: d }
  end

  def new_char(char, shift)
    if ALPHA.include?(char)
      new_index = (ALPHA.index(char) + shift) % ALPHA.count
      ALPHA[new_index]
    else
      char
    end
  end

  def original_char(char, shift)
    if ALPHA.include?(char)
      original_index = (ALPHA.index(char) - shift) % ALPHA.count
      ALPHA[original_index]
    else
      char
    end
  end
end
