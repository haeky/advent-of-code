input = ARGF
  .readlines
  .map { |line| line.chomp.split(/\D+/).map(&:to_i) }
  .map { |line| [line[0], line.drop(1)] }

class Integer
  def |(other)
    [self, other].map(&:to_s).join.to_i
  end
end

def calculate(calibrations, operators)
  calibrations.map do |total, numbers|
    operators.repeated_permutation(numbers.size - 1).any? do |permutation|
      total == permutation.zip(numbers[1..-1]).inject(numbers[0]) do |sum, (operator, x)|
        sum = sum.send(operator, x)
      end
    end ? total : 0
  end
end

puts "Part 1: #{calculate(input, [:+, :*]).sum}"
puts "Part 2: #{calculate(input, [:+, :*, :|]).sum}"

