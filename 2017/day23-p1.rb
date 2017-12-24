input = File.read('day23.txt')

@hash = Hash.new { |h, k| h[k] = 0 }
@instructions = input.chomp.split("\n")
@count = 0

def call(instruction)
  case instruction
  when /set (.) (.*)/
    @hash[$1] = @hash.fetch($2, $2.to_i)
  when /sub (.) (.*)/
    @hash[$1] -= @hash.fetch($2, $2.to_i)
  when /mul (.) (.*)/
    @hash[$1] *= @hash.fetch($2, $2.to_i)
    @count += 1
  when /jnz (.) (.*)/
    return if $1 == '1' ? $1 == 0 : @hash[$1].zero?

    @cursor = @instructions.index(instruction) + $2.to_i - 1
  else
    raise ArgumentError
  end
end


@cursor = 0

while @cursor < @instructions.size
  instruction = @instructions[@cursor]

  call(instruction)

  @cursor += 1
end

puts @count
