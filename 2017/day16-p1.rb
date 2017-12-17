input = File.read('day16.txt').chomp.split(',')
program = ('a'..'p').to_a

def dance(program, command)
  case command
  when /s(\d+)/
    program.rotate!(-$1.to_i)
  when /x(\d+)\/(\d+)/
    a = $1.to_i
    b = $2.to_i

    program[a], program[b] = program[b], program[a]
  when /p(\w+)\/(\w+)/
    a = program.index($1)
    b = program.index($2)

    program[a], program[b] = program[b], program[a]
  else
    raise ArgumentError
  end
end

input.each do |i|
  dance(program, i)
end

puts program.join.to_s
