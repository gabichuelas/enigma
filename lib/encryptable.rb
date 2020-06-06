module Encryptable
  def prepare(message)
    split_chars = message.chars
    split_chars.each_slice(4)
  end
end
