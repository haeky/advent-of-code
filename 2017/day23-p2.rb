require 'prime'

b = 57
b *= 100
b += 100_000
c = b + 17000

h = 0

(b..c).step(17) do |i|
  h += 1 unless Prime.prime?(i)
end

puts h
