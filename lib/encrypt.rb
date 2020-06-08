require_relative 'enigma_runner'

runner = EnigmaRunner.new

if ARGV[0] && ARGV[1]
  runner.run_encryption(ARGV[0], ARGV[1])
else
  puts "Wrong number of arguments, try again!"
end
