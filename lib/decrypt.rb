require_relative 'enigma'
# $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
# Created 'decrypted.txt' with the key 82648 and date 240818

encrypted_file = File.open(ARGV[0], 'r')
encryption = encrypted_file.read
encrypted_file.close

decrypted = File.open(ARGV[1], 'w')

enigma = Enigma.new
decryption = enigma.decrypt(encryption, ARGV[2], ARGV[3])

decrypted.write(decryption[:decryption])
decrypted.close

puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}"
