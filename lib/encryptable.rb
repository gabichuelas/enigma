require 'date'
require './lib/key'

module Encryptable
  KEY = Key.make
  INDEX_RANGES = [0..1, 1..2, 2..3, 3..4]
  DATE = Date.today.strftime("%d%m%y")
  ALPHA = ("a".."z").to_a << " "

  def prepare(message)
    split_chars = message.downcase.chars
    split_chars.each_slice(4)
  end

  def last_four(date)
    (date.to_i ** 2).to_s[-4..-1]
  end

  def create_shifts(key, date)
    INDEX_RANGES.each_with_index.reduce({}) do |shifts, (range, i)|
      shifts["#{i}"] ||= 0
      shifts["#{i}"] = key[range].to_i + last_four(date)[i].to_i
      shifts
    end
  end

end
