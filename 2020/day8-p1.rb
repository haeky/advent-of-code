instructions = File.read("#{__FILE__.split('-').first}.txt").split("\n").map { |x| x.split(' ') }

cursor = 0
accumulator = 0
stack = []

while cursor < instructions.size
  break if stack.include?(cursor)
  stack << cursor

  operation, argument = *instructions[cursor]

  case operation
  when 'acc'
    accumulator += argument.to_i
    cursor += 1
  when 'jmp'
    cursor += argument.to_i
  when 'nop'
    cursor += 1
  end
end

puts accumulator
