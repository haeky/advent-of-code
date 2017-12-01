inputs = File.read("#{__FILE__.split('-').first}.txt").each_line.to_a

replacements = inputs[0..-3].each_with_object(Hash.new { |h, k| h[k] = [] }) do |input, hash|
  source, replacement = input.scan(/(\w+)/).flatten
  hash[source] << replacement
end

molecules = inputs[-1].chomp.split(/([A-Z][a-z]?)/).reject(&:empty?)

result = molecules.each_with_index.map do |molecule, index|
  replacements[molecule].map do |replacement|
    clone = molecules.clone
    clone[index] = replacement
    clone.join
  end
end.flatten.uniq.size

p result
