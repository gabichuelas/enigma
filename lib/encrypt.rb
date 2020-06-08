require_relative 'enigma'
# $ cat > message.txt
# write your message, then CTL + D
# $ ruby ./lib/encrypt.rb message.txt encrypted.txt
# Created 'encrypted.txt' with the key 82648 and date 240818

message_file = File.open(ARGV[0], 'r')
message = message_file.read
message_file.close

encrypted = File.open(ARGV[1], 'w')

enigma = Enigma.new
encryption = enigma.encrypt(message)

encrypted.write(encryption[:encryption])
encrypted.close

puts "Created '#{ARGV[1]}' with the key #{encryption[:key]} and date #{encryption[:date]}"

# write a conditional in case there are not
# enough ARGV
# make these a class
# then put this in a  runner
encrypt = Encrypt.new
# (call it something else)
