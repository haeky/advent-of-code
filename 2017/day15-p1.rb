input = [516, 190]
factors = [16807, 48271]
divider = 2147483647

count = 0
a, b = *input

iteration.times do
  a = (a * factors.first) % divider
  b = (b * factors.last) % divider

  count += 1 if a & (2**16-1) == b & (2**16-1)
end

puts count
