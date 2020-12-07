input = File.read("#{__FILE__.split('-').first}.txt").split("\n")

@rules = input.each_with_object({}) do |rule, hash|
  outside, inside = * rule.split(' bags contain ')
  hash[outside] = inside.scan(/(?<count>\d+) (?<color>.*?) bag/).map(&:reverse).to_h.transform_values(&:to_i)
end

def possible_colors(color)
  @rules[color].keys + @rules[color].keys.map { |c| possible_colors(c) }.flatten
end

puts @rules.keys.map { |rule| possible_colors(rule).include?('shiny gold') }.count(true)
