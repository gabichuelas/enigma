require_relative 'enigma'

class EnigmaRunner < Enigma

  def run_encryption(input, output, key = KEY, date = DATE)
    message = open_read_close(input)
    encryption = encrypt(message, key, date)
    write_to_new_file(output, encryption[:encryption])

    puts "Created '#{output}' with the key #{encryption[:key]} and date #{encryption[:date]}"
  end

  def run_decryption(input, output, key = KEY, date = DATE)
  end

  def open_read_close(file)
    message_file = File.open(file, 'r')
    message = message_file.read
    message_file.close
    message
  end

  def write_to_new_file(filename, message)
    new_file = File.open(filename, 'w')
    new_file.write(message)
    new_file.close
  end

end
