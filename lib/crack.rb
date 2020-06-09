require_relative 'enigma_runner'

runner = EnigmaRunner.new

if ARGV[0] && ARGV[1] && ARGV[2]
  runner.run_crack(ARGV[0], ARGV[1], ARGV[2])
elsif ARGV[0] && ARGV[1]
  runner.run_crack(ARGV[0], ARGV[1])
else
  puts "Please include input/output file names and date code. If no date is supplied, today's date is used."
end
