inputs = File.read("#{__FILE__.split('-').first}.txt").each_line.to_a

replacements = Hash[inputs[0..-3].each_with_object({}) do |input, hash|
  source, replacement = input.scan(/(\w+)/).flatten
  hash[replacement] = source
end.sort_by { |k, v| k.length }.reverse]

molecule = inputs[-1].chomp

result = (0..1000).inject(0) do |total|
  replacements.each do |source, replacement|
    break if molecule.sub!(source, replacement)
  end
  total += 1
  break total if molecule == 'e'

  total
end

p result
