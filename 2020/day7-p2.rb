input = File.read("#{__FILE__.split('-').first}.txt").split("\n")

@rules = input.each_with_object({}) do |rule, hash|
  outside, inside = * rule.split(' bags contain ')
  hash[outside] = inside.scan(/(?<count>\d+) (?<color>.*?) bag/).map(&:reverse).to_h.transform_values(&:to_i)
end

def count_bags(color)
  @rules[color].map { |child, count| count + count * count_bags(child).to_i }.reduce(:+)
end

puts count_bags('shiny gold')
