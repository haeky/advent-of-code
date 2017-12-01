class Reindeer
  attr_accessor :speed, :duration, :rest, :distance, :points

  def initialize(speed, duration, rest)
    @speed = speed
    @duration = duration
    @rest = rest
    @points = 0
  end

  def fly(seconds)
    cycles = seconds / (rest + duration)
    left = seconds % (rest + duration)

    @distance = speed * duration * cycles + speed * [duration, left].min
    @distance
  end
end

inputs = File.read("#{__FILE__.split('-').first}.txt").each_line
reindeers = inputs.map do |input|
  speed, duration, rest = input.match(/(\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds./).values_at(2, 3, 4).map(&:to_i)
  Reindeer.new(speed, duration, rest)
end

(1..2503).each do |i|
  reindeers.each { |r| r.fly(i) }
  reindeers.each { |r| r.points += 1 if r.distance == reindeers.map(&:distance).max }
end

p reindeers.map(&:points).max
