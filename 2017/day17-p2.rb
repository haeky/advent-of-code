input = ARGV[0].to_i

cursor = 0
neighbor = 0

(1..50_000_000).each do |i|
  cursor = ((input + cursor) % i) + 1
  neighbor = i if cursor == 1
end

puts neighbor
