require_relative 'enigma_runner'

runner = EnigmaRunner.new

required = ARGV[0] && ARGV[1] && ARGV[2]

if required && ARGV[3]
  runner.run_decryption(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
elsif required
  runner.run_decryption(ARGV[0], ARGV[1], ARGV[2])
else
  puts "Please include input/output file names, as well as a 5 digit key, and optional date code"
end
