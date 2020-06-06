require 'date'
require_relative 'key'

class Enigma
  KEY = Key.make
  DATE = Date.today.strftime("%d%m%y")
  ALPHA = ("a".."z").to_a << " "

  def encrypt(message, key = KEY, date = DATE)
    prepare(message)
    # encryption method
    # returns Hash with encrypted message, key, and date
  end

  def create_shifts(key, date)
    last_four = (date.to_i ** 2).to_s[-4..-1]
    a = key[0..1].to_i + last_four[0].to_i
    b = key[1..2].to_i + last_four[1].to_i
    c = key[2..3].to_i + last_four[2].to_i
    d = key[3..4].to_i + last_four[3].to_i
    { a: a, b: b, c: c, d: d }
  end

  def prepare(message)
    split_chars = message.chars
    split_chars.each_slice(4)
  end

end

# enigma = Enigma.new
# enigma.encrypt("hello world")
