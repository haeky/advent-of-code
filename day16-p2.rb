target = {
  children: 3,
  cats: 7,
  samoyeds: 2,
  pomeranians: 3,
  akitas: 0,
  vizslas: 0,
  goldfish: 5,
  trees: 3,
  cars: 2,
  perfumes: 1
}

File.read("#{__FILE__.split('-').first}.txt").each_line do |line|
  properties = Hash[*line.scan(/(\w+): (\d)/).flatten]
  p line if properties.all? do |property, value|
    case property
    when "cats", "trees"
      value.to_i > target[property.to_sym]
    when "pomeranians", "goldfish"
      value.to_i < target[property.to_sym]
    else
      value.to_i == target[property.to_sym]
    end
  end
end

