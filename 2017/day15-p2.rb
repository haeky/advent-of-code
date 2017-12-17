input = [516, 190]
factors = [16807, 48271]
divider = 2147483647
multipliers = [4, 8]

count = 0

a, b = *input

5_000_000.times do
  begin
    a = (a * factors.first) % divider
  end until a % multipliers.first == 0

  begin
    b = (b * factors.last) % divider
  end until b % multipliers.last == 0

  count += 1 if a & (2**16-1) == b & (2**16-1)
end

puts count
