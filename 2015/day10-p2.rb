result = 50.times.inject('3113322113') do |input|
  input = input.chars.chunk { |i| i }.map { |i, x| x.size.to_s + i }.compact.join('')
end

p result.size
