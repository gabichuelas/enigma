require_relative 'encryptable'

class Cipher
  include Encryptable

  def shift_chars(message, key, date)
    shift = create_shifts(key, date)
    prepare(message).reduce([]) do |acc, char_array|
      char_array.each_with_index do |letter, i|
        acc << new_char(char_array[i], shift["#{i}"]) if char_array[i]
      end
      acc
    end
  end

  def unshift_chars(message, key, date)
    shift = create_shifts(key, date)
    prepare(message).reduce([]) do |acc, char_array|
      char_array.each_with_index do |letter, i|
        acc << original_char(char_array[i], shift["#{i}"]) if char_array[i]
      end
      acc
    end
  end

  def create_shifts(key, date)
    INDEX_RANGES.each_with_index.reduce({}) do |shifts, (range, i)|
      shifts["#{i}"] ||= 0
      shifts["#{i}"] = key[range].to_i + last_four(date)[i].to_i
      shifts
    end
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
