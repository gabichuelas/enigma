require_relative 'enigma'

message_file = File.open(ARGV[0], 'r')
message = message_file.read
message_file.close

encrypted = File.open(ARGV[1], 'w')

enigma = Enigma.new
encryption = enigma.encrypt(message)

encrypted.write(encryption[:encryption])
encrypted.close

puts "Created '#{ARGV[1]}' with the key #{encryption[:key]} and date #{encryption[:date]}"
