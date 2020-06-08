require_relative 'encrypt_runner'

runner = EnigmaRunner.new
required = ARGV[0] && ARGV[1]

if required && ARGV[2] && ARGV[3]
  runner.run_encryption(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
elsif required && ARGV[2]
  runner.run_encryption(ARGV[0], ARGV[1], ARGV[2], DATE)
elsif required && ARGV[3]
  runner.run_encryption(ARGV[0], ARGV[1], KEY, ARGV[3])
elsif required
  runner.run_encryption(ARGV[0], ARGV[1])
else
  puts "Wrong number of arguments, try again!"
end
