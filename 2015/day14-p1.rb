class Reindeer
  attr_accessor :speed, :duration, :rest

  def initialize(speed, duration, rest)
    @speed = speed
    @duration = duration
    @rest = rest
  end

  def fly(seconds)
    cycles = seconds / (rest + duration)
    left = seconds % (rest + duration)

    speed * duration * cycles + speed * [duration, left].min
  end
end

inputs = File.read("#{__FILE__.split('-').first}.txt").each_line
distances = inputs.map do |input|
  speed, duration, rest = input.match(/(\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds./).values_at(2, 3, 4).map(&:to_i)
  Reindeer.new(speed, duration, rest).fly(1000)
end

p distances.max
