instructions = File.read("#{__FILE__.split('-').first}.txt").split("\n").map { |x| x.split(' ') }

def execute(instructions)
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

  [cursor, accumulator]
end

instructions.each_with_index do |(operation, value), i|
  next if operation == 'acc'

  modified_instructions = Marshal.load(Marshal.dump(instructions))
  modified_instructions[i][0] = operation == 'jmp' ? 'nop' : 'jmp'

  cursor, accumulator = execute(modified_instructions)

  if cursor >= instructions.size
    puts accumulator
    break;
  end
end
