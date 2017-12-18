input = File.read('day18.txt')

@last_sound = 0
@hash = Hash.new { |h, k| h[k] = 0 }
@instructions = input.chomp.split("\n")

def call(instruction)
  case instruction
  when /snd (.)/
    @last_sound = @hash[$1]
  when /set (.) (.*)/
    @hash[$1] = @hash.fetch($2, $2.to_i)
  when /add (.) (.*)/
    @hash[$1] += @hash.fetch($2, $2.to_i)
  when /mul (.) (.*)/
    @hash[$1] *= @hash.fetch($2, $2.to_i)
  when /mod (.) (.*)/
    @hash[$1] %= @hash.fetch($2, $2.to_i)
  when /rcv (.)/
    return if @hash[$1].zero?
    puts @last_sound
    exit;
  when /jgz (.) (.*)/
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
