require_relative 'enigma'

class EnigmaRunner < Enigma

  def run_encryption(input, output)
    message = open_read_close(input)
    encryption = encrypt(message)
    write_to_new_file(output, encryption[:encryption])

    puts "Created '#{output}' with the key #{encryption[:key]} and date #{encryption[:date]}"
  end

  def run_decryption(input, output, key, date)
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
