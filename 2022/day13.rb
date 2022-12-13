require 'json'

input = File.read("day13.txt").split("\n\n").map { |pair| pair.split("\n").map { |line| JSON.parse(line) }}

class Array
  alias_method :spaceship_operator, :<=>

  def <=>(other)
    if other.is_a?(Integer)
      self <=> [other]
    else
      spaceship_operator(other)
    end
  end
end

class Integer
  alias_method :spaceship_operator, :<=>

  def <=>(other)
    if other.is_a?(Array)
      [self] <=> other
    else
      spaceship_operator(other)
    end
  end
end

# Part 1
p input.each_with_index.map { |(left, right), index| (left <=> right) == -1 ? index + 1 : 0 }.sum

# Part 2
dividers = [[[2]], [[6]]]
p (input.flatten(1) + dividers).sort.then { |packets| dividers.map { |divider| packets.index(divider) + 1 }}.inject(:*)
