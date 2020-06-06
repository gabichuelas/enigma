require_relative 'key'
require 'date'
require_relative 'encryptable'

class Enigma
  include Encryptable
  KEY = Key.make
  DATE = Date.today.strftime("%d%m%y")

  def encrypt(message, key = KEY, date = DATE)
    # helper that prepares message
    prepare(message)

    # encryption method
  end

end

# enigma = Enigma.new
# enigma.encrypt("hello world")
