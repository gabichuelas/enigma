require_relative 'enigma'

class EnigmaRunner < Enigma

  def run_encryption(input, output)
    message = open_read_close(input)
    encryption = encrypt(message)
    write_to_new_file(output, encryption[:encryption])

    puts "Created '#{output}' with the key #{encryption[:key]} and date #{encryption[:date]}"
  end

  def run_decryption(input, output, key, date = DATE)
    encryption = open_read_close(input)
    decryption = decrypt(encryption, key, date)
    write_to_new_file(output, decryption[:decryption])

    puts "Created '#{output}' with the key #{decryption[:key]} and date #{decryption[:date]}"
  end

  def run_crack(input, output, date = DATE)
    encryption = open_read_close(input).chomp!
    cracked = crack(encryption, date)
    write_to_new_file(output, cracked[:decryption])

    puts "Created '#{output}' with the key #{cracked[:key]} and date #{cracked[:date]}"
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
