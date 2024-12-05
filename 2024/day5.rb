rules, updates = ARGF.read.split("\n\n")

Rule = Struct.new(:value, :after) do
  def <=>(other)
    if after.include?(other.value)
      -1
    elsif other.value == value
      0
    else
      1
    end
  end
end

rules = rules
  .split("\n")
  .map { |rule| rule.split("|") }
  .group_by(&:first)
  .transform_values { |v| v.map(&:last) }
  .each_with_object({}) do |(value, after), hash|
    hash[value] = Rule.new(value, after)
  end

(rules.values.map(&:after).flatten.uniq - rules.keys).each do |value|
  rules[value] = Rule.new(value, [])
end

result = updates.split("\n").map { |u| u.split(",") }.map do |update|
  sorted = update.map { |v| rules[v] }.sort.map(&:value)
  sorted == update ? update[update.size/2] : 0
end.map(&:to_i).sum

puts "Part 1: #{result}"

result = updates.split("\n").map { |u| u.split(",") }.map do |update|
  sorted = update.map { |v| rules[v] }.sort.map(&:value)
  sorted == update ? 0 : sorted[sorted.size/2]
end.map(&:to_i).sum

puts "Part 2: #{result}"
