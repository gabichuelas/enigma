require 'date'
require './lib/key'

module Encryptable
  KEY = Key.make
  DATE = Date.today.strftime("%d%m%y")
  ALPHA = ("a".."z").to_a << " "

  def prepare(message)
    split_chars = message.downcase.chars
    split_chars.each_slice(4)
  end
end
