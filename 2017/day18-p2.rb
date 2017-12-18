input = File.read('day18.txt')

@last_sound = 0
@hash = { a: Hash.new { |h, k| h[k] = 0 }, b: Hash.new { |h, k| h[k] = 0 } }
@hash[:a]['p'] = 0
@hash[:b]['p'] = 1
@instructions = input.chomp.split("\n")

@memory = { a: [], b: [] }
@count = 0

def call(instruction, program)
  case instruction
  when /snd (.)/
    @memory[program == :a ? :b : :a] << @hash[program].fetch($1, $1.to_i)
    @count += 1 if program == :b
  when /set (.) (.*)/
    @hash[program][$1] = @hash[program].fetch($2, $2.to_i)
  when /add (.) (.*)/
    @hash[program][$1] += @hash[program].fetch($2, $2.to_i)
  when /mul (.) (.*)/
    @hash[program][$1] *= @hash[program].fetch($2, $2.to_i)
  when /mod (.) (.*)/
    @hash[program][$1] %= @hash[program].fetch($2, $2.to_i)
  when /rcv (.)/
    raise StandardError if @memory[program].empty?

    @hash[program][$1] = @memory[program].shift
  when /jgz (.) (.*)/
    return if $1 != '1' and @hash[program][$1] <= 0
    @cursor[program] = @instructions.index(instruction) + @hash[program].fetch($2, $2.to_i) - 1
  else
    raise ArgumentError
  end
end

@cursor = { a: 0, b: 0 }

while true
  result = [:a, :b].map do |program|
    instruction = @instructions[@cursor[program]]
    begin
      call(instruction, program)

      @cursor[program] += 1
    rescue StandardError
      false
    end
  end

  break if result.all? { |r| r == false }
end

puts @count
