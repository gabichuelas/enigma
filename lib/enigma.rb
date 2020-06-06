# require_relative 'key'
# require 'date'

class Enigma

@@key = Key.make
@@date = Date.today.strftime("%d%m%y")

  def encrypt(message, key = @@key, date = @@date)
    # helper that prepares message
    # encryption method
  end

end
