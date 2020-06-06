class Enigma
  
@@key = Key.new
@@date = Date.today.strftime(%d%m%y)

  def encrypt(message, key = @@key, date = @@date)
    # helper that prepares message
    # encryption method
  end

end
